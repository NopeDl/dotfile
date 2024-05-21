# 创建一个函数来替代 rm 命令
function rm
  # 检查回收站目录是否存在，如果不存在则创建
  if not test -d ~/deleted
    mkdir -p ~/deleted
  end

  # 获取当前日期时间作为前缀，确保每次删除操作都具有不同的标识
  set timestamp (date +"%Y%m%d_%H%M%S")

  # 解析选项和文件/目录参数
  set options
  set files

  for arg in $argv
    # 检查是否是选项
    if string match -q -- '-*' $arg
      set options $options $arg
    else
      set files $files $arg
    end
  end

  # 遍历所有文件/目录参数，将每个文件或目录移动到回收站
  for file in $files
    if test -e $file
      # 获取文件名和目录路径
      set filename (basename $file)
      set dirpath (dirname $file)
      
      # 构建目标路径，包含文件名和时间戳
      set dest "$HOME/deleted/$filename.$timestamp"

      # 如果是目录，确保目标路径不存在相同名称的目录
      if test -d $file
        mv $file $dest
      else
        # 如果是文件，确保目标路径不存在相同名称的文件
        mv $file $dest
      end
    else
      # 如果文件或目录不存在，打印错误信息
      echo "rm: cannot remove '$file': No such file or directory"
      return
    end
  end

  # 输出移动的文件路径
  echo "Moved to trash: $files"
end

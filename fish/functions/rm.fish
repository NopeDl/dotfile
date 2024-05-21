# 将rm命令改为放入回收站
function rm
  # 遍历所有参数
  for arg in $argv
    # 跳过以 - 开头的参数
    if string match -qr '^-' $arg
      continue
    end

    # 检查要删除的文件或目录是否存在
    if not test -e "$arg"
      echo "错误：'$arg' 不存在"
      continue
    end

    # 检查要删除的目标是文件还是目录
    if test -d "$arg"
      # 如果是目录，执行递归删除
      command mv "$arg" ~/deleted/
    else if test -f "$arg"
      # 如果是文件，直接移动到删除目录
      command mv "$arg" ~/deleted/
    else
      # 如果是其他类型的文件（如符号链接等），给出错误提示
      echo "错误：'$arg' 不是一个文件或目录"
    end
  end
end

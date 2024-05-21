# 创建一个函数来清空回收站
function empty-trash
  # 检查回收站目录是否存在
  if test -d ~/deleted
    # 删除回收站目录及其内容
    command rm -rf ~/deleted/*
    echo "Trash is now empty."
  else
    echo "Trash is already empty."
  end
end

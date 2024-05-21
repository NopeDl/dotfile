function clear_deleted
  # 检查 ~/deleted 目录是否存在
  if not test -d ~/deleted
    echo "错误：'~/deleted' 目录不存在"
    return 1
  end
  command rm -rf ~/deleted/*
end

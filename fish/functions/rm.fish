# 将rm命令改为放入回收站
function rm
  command mv $argv[2] ~/deleted/
end

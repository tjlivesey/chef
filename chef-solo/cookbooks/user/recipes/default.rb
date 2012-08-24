user "deploy" do
  comment "Create deploy user"
  gid "admin"
  home "/home/deploy"
  supports :manage_home => true
end
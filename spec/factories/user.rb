FactoryBot.define do
 factory :user do
   name {"市川"}
   email {"xxx@xxx.com"}
   password {"password"}
   password_confirmation {"password"}
 end

 factory :admin_user, class: User do
   name {"洋平さん"}
   email  {"yyy@yyy.com"}
   password {"password"}
   password_confirmation {"password"}
 end
end

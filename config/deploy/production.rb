ask(:answer, 'Do you really want to push to prod(yes or no)?')

case fetch(:answer)
  when 'yes'
    # set :task_servers, %w(172.31.0.223 172.31.42.208)
    set :servers, %w(172.31.7.205)
  else
    set :task_servers, []
    set :servers, []
end

# fetch(:task_servers).each_with_index do |server_ip, index|
#   server server_ip,
#          user: "ec2-user",
#          roles: %w(app sidekiq),
#          ssh_options: {
#            user: "ec2-user", # overrides user setting above
#            # keys: %w(/home/user_name/.ssh/id_rsa),
#            forward_agent: false,
#            auth_methods: %w(publickey password)
#            # password: "please use keys"
#          }
# end

fetch(:servers).each do |server_ip|
  server server_ip,
         user: "ec2-user",
         roles: %w{app},
         ssh_options: {
           user: "ec2-user", # overrides user setting above
           # keys: %w(/home/user_name/.ssh/id_rsa),
           forward_agent: false,
           auth_methods: %w(publickey password)
           # password: "please use keys"
         }
end

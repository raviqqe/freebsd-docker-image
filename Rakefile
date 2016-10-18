task :nsd do |t|
  sh 'cd #{t.name} && rake'
end

task :cert do
  sh 'sudo certbot certonly --standalone -d raviqqe.com -d git.raviqqe.com \
                            -d www.raviqqe.com --email raviqqe@gmail.com \
                            --non-interactive --agree-tos 2>&1 | \
                            tee ~/certbot.log'
end

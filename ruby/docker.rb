def docker_tasks image, run_options, rm_or_stop
  raise "The argument, rm_or_stop must be :rm or :stop." \
        if not [:rm, :stop].include? rm_or_stop

  task_run image, run_options
  send "task_#{rm_or_stop}", image

  task :default => :build
end

def task_build image
  task :build do
    sh %Q(sudo docker build -t #{image} .)
  end
end

def task_run image, options
  task_build image

  task :run => :build do
    hostname = [image, '.', `hostname`.strip].join
    sh %Q(sudo docker run -d -h #{hostname} --name #{hostname} #{options} \
                          #{image})
  end
end

def docker_subcommand_on_image subcommand, image, another_grep=:cat
  containers = `sudo docker ps -a | grep -e #{image} | #{another_grep} | \
                awk '{print $1}'`
  %Q(sudo docker #{subcommand} #{containers}) if containers.strip.length > 0
end

def task_rm image
  task_stop image

  task :rm => :stop do
    maybe_sh docker_subcommand_on_image(:rm, image)
  end
end

def task_stop image
  task :stop do
    maybe_sh docker_subcommand_on_image(:stop, image, 'grep -v Exited')
  end
end

def maybe_sh command
  sh command if command
end

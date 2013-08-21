require 'rake'
require 'rake/clean'

HOME = File.expand_path '~'

CLEAN.add("#{HOME}/.gvim*")
CLEAN.add("#{HOME}/.vim*")
CLEAN.add('.vim/bundle/**')

CLOBBER.add('.vim/custom')
CLOBBER.add('.vim/easytags')
CLOBBER.add('.vim/UltiSnips')

directory '.vim/custom'
directory '.vim/easytags'
directory '.vim/UltiSnips'

task :default => [:install]
task :install => ['.vim/custom', '.vim/easytags', '.vim/UltiSnips', :clean]
task :clean => [:backup]

desc "backup existing vim files"
task :backup do |t,args|
  args.with_defaults :backup_dir => "backup_" << `date +%FT%T`

  existing_files = find_existing_files

  unless existing_files.empty?
    backup_dir = File.expand_path(args.backup_dir)

    RakeFileUtils.mkdir_p(backup_dir)
    RakeFileUtils.move(existing_files, backup_dir)
  end
end

desc 'install vim config'
task :install do
  expand(Dir['.vim*']).each do |file|
    RakeFileUtils.symlink(file, HOME)
  end

  message("cloning Shougo/neobundle.vim into ~/.vim/bundle/")
  puts `cd ~/.vim/bundle; git clone --recursive https://github.com/Shougo/neobundle.vim`

  message("installing bundles")
  puts `vim -u install.vimrc`
end


def find_existing_files
  expand(['~/.vim', '~/.vimrc', '~/.gvimrc']).select do |name|
    File.exists?(name) && !File.symlink?(name)
  end
end

def expand( files )
  files.map {|f| File.expand_path(f) }
end

def message( msg )
  length = 80
  b = "\e[1m"
  t = "\e[0m"

  puts ''
  puts ''.center(length, '#')
  puts "##{b}#{msg.center(length - 2)}#{t}#"
  puts ''.center(length, '#')
  puts ''
end

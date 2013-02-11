#!/usr/bin/env ruby

require 'fileutils'

def run
  Dir.chdir File.dirname __FILE__
  git_pull
  install_oh_my_zsh
  switch_to_zsh
  symlink_all_files
end

def git_pull
  puts 'git pull'
  system %Q{git pull}
end

def symlink_all_files
  files = Dir['**/*'].reject{|file| File.directory? file }
  files -= %w[install.rb]

  files.each do |file|
    link = File.join Dir.home, ".#{file}"
    link_path = File.dirname(link)
    file_path = File.join(File.dirname(__FILE__), file)

    if link =~ /\// && !File.exists?(link_path)
      FileUtils.mkdir_p(link_path, verbose: true)
    end

    if File.exists?(link) || File.symlink?(link)
      unless File.symlink?(link) && File.readlink(link) == file_path
        FileUtils.rm link, force: true, verbose: true
        FileUtils.ln_s file_path, link, verbose: true
      end
    else
      FileUtils.ln_s file, link, verbose: true
    end
  end
end

def install_oh_my_zsh
  unless File.exist?(File.join(Dir.home, '.oh-my-zsh'))
    print "install oh-my-zsh? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing oh-my-zsh"
      system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
    when 'q'
      exit
    else
      puts "skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end

def switch_to_zsh
  unless ENV["SHELL"] =~ /zsh/
    print "switch to zsh? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "switching to zsh"
      system %Q{chsh -s `which zsh`}
    when 'q'
      exit
    else
      puts "skipping zsh"
    end
  end
end


run

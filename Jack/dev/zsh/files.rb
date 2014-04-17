# -*- coding: utf-8 -*-
def count dir
  `ls #{dir} | wc -l`.to_i
end
desktop = count "$HOME/Desktop"
downloads = count "$HOME/Downloads"
print (downloads.zero? ? "" : "%B%F{magenta}⬇#{downloads}%f%b") +
  ((desktop.zero? or downloads.zero?) ? "" : " ") +
  (desktop.zero? ? "" : "%B%F{blue}▙#{desktop}%f%b") +
  ((desktop.zero? and downloads.zero?) ? "" : " %F{green}|%f ")

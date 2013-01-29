import os

def vcs_status():
  from powerline.lib.vcs import guess
  repo = guess(os.path.abspath(os.getcwd()))
  if repo and repo.status():
    return "X"
  else:
    return None

local status, git = pcall(require, 'git')
if (not status) then return end

git.setup {
  keymaps = {
    blame = ';gb',
    quit_blame = 'q',
    diff = ';gd',
    diff_close = 'q'
  }
}

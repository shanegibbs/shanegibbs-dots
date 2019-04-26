setlocal shiftwidth=2
setlocal tabstop=2

let b:ale_fixers = {'go':['gofmt','goimports']}
let b:ale_linters = {'*':['golangserver']}
let b:ale_fix_on_save = 1
let b:ale_linters = {'go': ['gometalinter', 'gofmt']}

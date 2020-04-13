let s:repoPath=expand('<sfile>:p:h:h')
function! s:dbInit()
    let repoPath = s:repoPath
    let dbFile = '/misc/wubi.txt'
    let dbCountFile = '/misc/wubi_count.txt'

    let db = ZFVimIM_dbInit({
                \   'name' : 'wubi',
                \ })
    call ZFVimIM_cloudRegister({
                \   'repoPath' : repoPath,
                \   'dbFile' : dbFile,
                \   'dbCountFile' : dbCountFile,
                \   'gitUserEmail' : get(g:, 'ZFVimIM_wubi_gitUserEmail', get(g:, 'zf_git_user_email', '')),
                \   'gitUserName' : get(g:, 'ZFVimIM_wubi_gitUserName', get(g:, 'zf_git_user_name', '')),
                \   'gitUserToken' : get(g:, 'ZFVimIM_wubi_gitUserToken', get(g:, 'zf_git_user_token', '')),
                \   'dbId' : db['dbId'],
                \ })
endfunction

augroup ZFVimIM_wubi_augroup
    autocmd!
    autocmd User ZFVimIM_event_OnDbInit call s:dbInit()
augroup END


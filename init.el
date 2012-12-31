(defun quick-compile ()
"A quick compile funciton for C++"
(interactive)
(compile (concat "g++ " (buffer-name (current-buffer)) " -g -pg"))
)

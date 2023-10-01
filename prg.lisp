(ql:quickload "str")

(defun remove-substr (str substr)
  (str:replace-all substr "" str))

(defun remove-substrs (str substrs)
  (reduce #'remove-substr substrs :initial-value str))

(defun get-domain-name (domain)
  (let* ((trimmed (remove-substrs domain '("https://" "http://" "www.")))
	 (domain-frags (str:split "." trimmed)))
    (car domain-frags)))

(defun four-chars-or-less (url)
  (<= (length (get-domain-name url)) 4)) 

(four-chars-or-less "https://www.jyssh.net") 

(loop
  for url in (uiop:read-file-lines "input.txt")
  when (four-chars-or-less url)
    collect url)

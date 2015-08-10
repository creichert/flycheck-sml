;;; flycheck-sml.el --- Flycheck: Standard ML -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2015 Christopher Reichert <creichert07@gmail.com>
;;
;; Author: Christopher Reichert <creichert07@gmail.com>
;; URL: https://github.com/creichert/flycheck-sml
;; Keywords: tools, convenience
;; Version: 0.1
;; Package-Requires: ((emacs "24.1") (flycheck "0.22"))
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
;;; Commentary:
;;
;; Configure basic Standard ML syntax checking by Flycheck.

(require 'flycheck)

(flycheck-define-checker sml-mlton
  "A Standard ML syntax and type checker using mlton.

See URL `http://mlton.org'."
  :command ("mlton" source)
  :error-patterns
  ((error line-start
          "Error: " (file-name) " " line "." column ".\n"
	  "  " (message) line-end)
   (error line-start "compilation aborted: parseAndElaborate reported errors" line-end))
  :modes (sml-mode))

(eval-after-load 'flycheck
  '(add-to-list 'flycheck-checkers 'sml-mlton))

(provide 'flycheck-sml)

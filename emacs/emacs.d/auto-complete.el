<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: auto-complete.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=auto-complete.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: auto-complete.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=auto-complete.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for auto-complete.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=auto-complete.el" />
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2101513-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22auto-complete.el%22">auto-complete.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="download/auto-complete.el">Download</a></p><pre class="code"><span class="linecomment">;;; auto-complete.el --- Inline auto completion</span>

<span class="linecomment">;; Copyright (C) 2008, 2009  MATSUYAMA Tomohiro</span>

<span class="linecomment">;; Author: MATSUYAMA Tomohiro &lt;t.matsuyama.pub@gmail.com&gt;</span>
<span class="linecomment">;; Keywords: convenience</span>
<span class="linecomment">;; Version: 0.2.0</span>

<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation, either version 3 of the License, or</span>
<span class="linecomment">;; (at your option) any later version.</span>

<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program.  If not, see &lt;http://www.gnu.org/licenses/&gt;.</span>

<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This extension provides a way to complete with popup menu like:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     def-!-</span>
<span class="linecomment">;;     +-----------------+</span>
<span class="linecomment">;;     |defun::::::::::::|</span>
<span class="linecomment">;;     |defvar           |</span>
<span class="linecomment">;;     |defmacro         |</span>
<span class="linecomment">;;     |       ...       |</span>
<span class="linecomment">;;     +-----------------+</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You can complete by typing and selecting menu.</span>
<span class="linecomment">;; Enjoy!</span>

<span class="linecomment">;;; Qualification:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This extension can work property on GNU Emacs 22 or higher.</span>

<span class="linecomment">;;; Installation:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; To use this extension, locate all .el files of this package to your load-path directory.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     $ cp auto-complete-x.x.x/*.el ~/.emacs.d/</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; And write following code into your .emacs.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     (require 'auto-complete)</span>
<span class="linecomment">;;     (global-auto-complete-mode t)</span>

<span class="linecomment">;;; Tips:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Use C-n/C-p to select candidates</span>
<span class="linecomment">;; --------------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Add following code to your .emacs.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;     (define-key ac-complete-mode-map "\C-n" 'ac-next)</span>
<span class="linecomment">;;     (define-key ac-complete-mode-map "\C-p" 'ac-previous)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Don't start completion automatically</span>
<span class="linecomment">;; ------------------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Add following code to your .emacs.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     (setq ac-auto-start nil)</span>
<span class="linecomment">;;     (global-set-key "\M-/" 'ac-start)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; or</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     ;; start completion when entered 3 characters</span>
<span class="linecomment">;;     (setq ac-auto-start 3)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Stop completion</span>
<span class="linecomment">;; ---------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Add following code to your .emacs.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     (define-key ac-complete-mode-map "\M-/" 'ac-stop)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Now you can stop completion by pressing M-/.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Completion by TAB</span>
<span class="linecomment">;; -----------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Add following code to your .emacs.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     (define-key ac-complete-mode-map "\t" 'ac-complete)</span>
<span class="linecomment">;;     (define-key ac-complete-mode-map "\r" nil)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Do What I Mean mode</span>
<span class="linecomment">;; -------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; If DWIM (Do What I Mean) mode is enabled,</span>
<span class="linecomment">;; the following features is available:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; a. TAB (ac-expand) behave as completion (ac-complete)</span>
<span class="linecomment">;;    when only one candidate is left</span>
<span class="linecomment">;; b. TAB (ac-expand) behave as completion (ac-complete)</span>
<span class="linecomment">;;    after you select candidate</span>
<span class="linecomment">;; c. Disapear automatically when you</span>
<span class="linecomment">;;    complete a candidate.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; DWIM mode is enabled by default.</span>
<span class="linecomment">;; You can enable this feature by</span>
<span class="linecomment">;; setting `ac-dwim' to t.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     (setq ac-dwim t)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Change default sources</span>
<span class="linecomment">;; ----------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     (setq-default ac-sources '(ac-source-abbrev ac-source-words-in-buffer))</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Change sources for particular mode</span>
<span class="linecomment">;; ----------------------------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     (add-hook 'emacs-lisp-mode-hook</span>
<span class="linecomment">;;                 (lambda ()</span>
<span class="linecomment">;;                   (setq ac-sources '(ac-source-words-in-buffer ac-source-symbols))))</span>

<span class="linecomment">;;; History:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-03-18</span>
<span class="linecomment">;;      * auto-complete.el 0.2.0 released</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-03-04</span>
<span class="linecomment">;;      * fixed menu position bug</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-03-02</span>
<span class="linecomment">;;      * made a source be able to be just a function which returns candidates</span>
<span class="linecomment">;;      * added ac-source-words-in-all-buffer</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-03-01</span>
<span class="linecomment">;;      * added basic cache facility</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-02-20</span>
<span class="linecomment">;;      * fixed menu position bug at long line (thanks rubikitch &lt;rubikitch@ruby-lang.org&gt;)</span>
<span class="linecomment">;;      * made dictionary source generator (ac-define-dictionary-source)</span>
<span class="linecomment">;;      * devided into some files (auto-complete-ruby.el, auto-complete-yasnippet.el, etc)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-02-19</span>
<span class="linecomment">;;      * added ac-trigger-commands switch</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-02-10</span>
<span class="linecomment">;;      * added ac-stop function (suggestion from Andy Stewart)</span>
<span class="linecomment">;;      * added ac-override-local-map switch (suggestion from Andy Stewart)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-02-03</span>
<span class="linecomment">;;      * omni completion redesign</span>
<span class="linecomment">;;      * ac-sources is now buffer local for every buffer</span>
<span class="linecomment">;;      * fixed a menu position bug (thanks Andy Stewart)</span>
<span class="linecomment">;;      * fixed byte-compile warnings (thanks Andy Stewart)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-01-22</span>
<span class="linecomment">;;      * added face/selection-face property for sources</span>
<span class="linecomment">;;      * supported menu scroll</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-01-20</span>
<span class="linecomment">;;      * omni completion</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-12-24</span>
<span class="linecomment">;;      * suppress errors on command hook</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-12-03</span>
<span class="linecomment">;;      * changed ac-dwim to nil by default</span>
<span class="linecomment">;;      * made menu to be able to adjust width</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-12-03</span>
<span class="linecomment">;;      * renamed ac-find-function to ac-prefix-function</span>
<span class="linecomment">;;      * renamed ac-target to ac-prefix</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-11-26</span>
<span class="linecomment">;;      * auto-complete.el 0.1.0 released</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-11-19</span>
<span class="linecomment">;;      * thanks for Taiki SUGAWARA &lt;buzz.taiki@gmail.com&gt;</span>
<span class="linecomment">;;      *   added source ac-source-abbrev</span>
<span class="linecomment">;;      *   added source ac-source-symbols</span>
<span class="linecomment">;;      * added ac-expand-common to expand common part</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-11-18</span>
<span class="linecomment">;;      * added ac-auto-start switch</span>
<span class="linecomment">;;      * added ac-dwim switch</span>
<span class="linecomment">;;      * changed menu popup behavior at end of window</span>
<span class="linecomment">;;      *   thanks rubikitch &lt;rubikitch@ruby-lang.org&gt;, kazu-yamamoto.</span>
<span class="linecomment">;;      * fixed canceler bug</span>
<span class="linecomment">;;      * changed to use overriding-local-map instead of minor mode map</span>
<span class="linecomment">;;      * changed default key bindings</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-11-16</span>
<span class="linecomment">;;      * supported candidates by using sources</span>
<span class="linecomment">;;      * added automatically start swtich</span>
<span class="linecomment">;;      * fixed some bug</span>
<span class="linecomment">;;      * added source ac-source-files-in-current-dir</span>
<span class="linecomment">;;      * added source ac-source-words-in-buffer</span>
<span class="linecomment">;;      * added source ac-source-yasnippet</span>
<span class="linecomment">;;      * renamed ac-enum-candidates-function to ac-candidate-function</span>
<span class="linecomment">;;      * renamed ac-find-target-function to ac-find-function</span>
<span class="linecomment">;;      * ac-find-function and ac-candidate-function is not buffer local variable now</span>
<span class="linecomment">;;      * made candidates visible when you are end of line</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-11-11</span>
<span class="linecomment">;;      * by reporting from rubikitch &lt;rubikitch@ruby-lang.org&gt;</span>
<span class="linecomment">;;      *   renamed hook name</span>
<span class="linecomment">;;      *   registered backward-delete-char as special command</span>
<span class="linecomment">;;      * fixed code for creating candidates</span>
<span class="linecomment">;;      * made auto-complete disabled when isearch-mode enabled</span>
<span class="linecomment">;;      * added some major-mode into ac-modes</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2008-11-09</span>
<span class="linecomment">;;      * auto-complete.el 0.0.1 released</span>
<span class="linecomment">;;      * fixed double-width character displaying problem</span>
<span class="linecomment">;;      * fixed menu position following tab character</span>
<span class="linecomment">;;      * made candidates visible when you are end of window</span>

<span class="linecomment">;;; TODO:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; - test facility</span>
<span class="linecomment">;; - support composed chars</span>
<span class="linecomment">;; - fuzzy match</span>
<span class="linecomment">;; - minibuffer completion</span>
<span class="linecomment">;; - dictionary</span>
<span class="linecomment">;; - documentation</span>
<span class="linecomment">;; - performance issue (cache issue)</span>
<span class="linecomment">;; - fix narrowing bug (reported by Yuto Hayamizu &lt;y.hayamizu@gmail.com&gt;)</span>
<span class="linecomment">;; - care about undo (buffer-disable-undo)</span>
<span class="linecomment">;; - scroll bar (visual)</span>
<span class="linecomment">;; - show description</span>
<span class="linecomment">;; - semantic</span>
<span class="linecomment">;; - use cl</span>
<span class="linecomment">;; - icon</span>
<span class="linecomment">;; - refactoring (especially menu)</span>
<span class="linecomment">;; - linum.el bug (reported by Andy Stewart)</span>
<span class="linecomment">;; - flymake bug (reported by TiagoCamargo)</span>

<span class="linecomment">;;; Code:</span>

 

(defgroup auto-complete nil
  "<span class="quote">Auto completion with popup menu</span>"
  :group 'convenience
  :prefix "<span class="quote">auto-complete-</span>")

(defcustom ac-candidate-menu-height 10
  "<span class="quote">Max height of candidate menu.</span>"
  :type 'number
  :group 'auto-complete)

(defcustom ac-candidate-max 10
  "<span class="quote">Max of number of candidates.</span>"
  :type 'number
  :group 'auto-complete)

(defcustom ac-modes
  '(emacs-lisp-mode lisp-interaction-mode
                    c-mode cc-mode c++-mode java-mode
                    perl-mode cperl-mode python-mode ruby-mode
                    ecmascript-mode javascript-mode js2-mode php-mode css-mode
                    makefile-mode sh-mode fortran-mode f90-mode ada-mode
                    xml-mode sgml-mode)
  "<span class="quote">Major modes `auto-complete-mode' can run on.</span>"
  :type '(list symbol)
  :group 'auto-complete)

(defcustom ac-trigger-commands
  '(self-insert-command)
  "<span class="quote">Trigger commands that specify whether `auto-complete' should start or not.</span>"
  :type '(list symbol)
  :group 'auto-complete)

(defcustom ac-auto-start t
  "<span class="quote">Non-nil means completion will be started automatically.
Positive integer means if a length of a word you entered is larger than the value,
completion will be started automatically.
If you specify `nil', never be started automatically.</span>"
  :group 'auto-complete)

(defcustom ac-dwim nil
  "<span class="quote">Non-nil means `auto-complete' works based on Do What I Mean.</span>"
  :type 'boolean
  :group 'auto-complete)

(defcustom ac-override-local-map nil
  "<span class="quote">Non-nil mean use `ac-complete-mode-map' override local map.
Please set it to non-nil only if you faced to some problem about 
minor-mode keymap conflicts.</span>"
  :type 'boolean
  :group 'auto-complete)

(defface ac-candidate-face
  '((t (:background "<span class="quote">lightgray</span>" :foreground "<span class="quote">black</span>")))
  "<span class="quote">Face for candidate.</span>"
  :group 'auto-complete)

(defface ac-selection-face
  '((t (:background "<span class="quote">blue</span>" :foreground "<span class="quote">white</span>")))
  "<span class="quote">Face for the selected candidate.</span>"
  :group 'auto-complete)

(defvar auto-complete-mode-hook nil
  "<span class="quote">Hook for `auto-complete-mode'.</span>")

(defvar ac-menu nil
  "<span class="quote">Menu instance.</span>")

(defvar ac-menu-direction 1
  "<span class="quote">Positive integer means `ac-menu' grows forward.
Or, `ac-menu' grows backward.</span>")

(defvar ac-menu-offset 0
  "<span class="quote">Offset to contents.</span>")

(defvar ac-menu-scroll 0
  "<span class="quote">Scroll top of `ac-menu'.</span>")

(defvar ac-completing nil
  "<span class="quote">Non-nil means `auto-complete-mode' is now working on completion.</span>")

(defvar ac-saved-window-start nil
  "<span class="quote">Saved window start value for restore.</span>")

(defvar ac-saved-window-hscroll nil
  "<span class="quote">Saved window hscroll value for restore.</span>")

(defvar ac-buffer nil
  "<span class="quote">A buffer where auto-complete is started.</span>")

(defvar ac-point nil
  "<span class="quote">Start point of prefix.</span>")

(defvar ac-old-point nil
  "<span class="quote">Previous start point of prefix.</span>")

(defvar ac-prefix nil
  "<span class="quote">Prefix.</span>")
(defvaralias 'ac-target 'ac-prefix)

(defvar ac-limit 0
  "<span class="quote">Limit of number of candidates.</span>")

(defvar ac-candidates nil
  "<span class="quote">Current candidates.</span>")

(defvar ac-selection nil
  "<span class="quote">Current candidate index.</span>")

(defvar ac-dwim-enable nil
  "<span class="quote">Non-nil means DWIM completion will be allowed.</span>")

(defvar ac-setup-function 'ac-sources-setup
  "<span class="quote">This function will be called when `auto-complete-mode' is enabled.</span>")

(defvar ac-prefix-function 'ac-sources-prefix
  "<span class="quote">When `auto-complete-mode' finds it can start completion
or update candidates, it will call this function to find a
start point of the prefix.

If this function returns a point `auto-complete-mode'
will set the substring between the point and current point to `ac-prefix'.
And also it will start completion or update candidates by using
the `ac-prefix'.

If this function returns `nil', `auto-complete-mode'
ignore starting completion or stop completing.</span>")
(defvaralias 'ac-find-function 'ac-prefix-function)

(defvar ac-init-function 'ac-sources-init
  "<span class="quote">This function will be called when candidate menu is setupped.</span>")

(defvar ac-cleanup-function 'ac-sources-cleanup
  "<span class="quote">This function will be called when candidate menu is cleanupped</span>")

(defvar ac-candidate-function 'ac-sources-candidate
  "<span class="quote">This function can return candidates as list by
using the `TARGET' that is given as a first argument.</span>")

(defvar ac-complete-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "<span class="quote">\t</span>" 'ac-expand)
    (define-key map "<span class="quote">\r</span>" 'ac-complete)
    
    (define-key map [down] 'ac-next)
    (define-key map [up] 'ac-previous)

    map)
  "<span class="quote">Keymap for completion.</span>")

(defvar ac-saved-local-map nil
  "<span class="quote">Old keymap before `auto-complete' activated.</span>")

 

<span class="linecomment">;;;; Auto completion</span>

(defun ac-setup-menu (point width)
  "<span class="quote">Setup popup menu.</span>"
  (when ac-menu
    <span class="linecomment">;; reposition</span>
    (ac-menu-delete ac-menu)
    (setq ac-menu nil))
  (save-excursion
    (goto-char point)
    (let ((column (ac-current-physical-column))
          (line (line-number-at-pos)))
      (setq ac-saved-window-start (window-start))
      (setq ac-saved-window-hscroll (window-hscroll))
      (setq ac-menu-direction
            (if (and (&gt; line ac-candidate-menu-height)
                     (&gt; ac-candidate-menu-height
                        (-
                         (max 1 (- (window-height)
                                   (if mode-line-format 1 0)
                                   (if header-line-format 1 0)))
                         (count-lines (window-start) (point)))))
                -1
              1))
      (let ((window-width (window-width))
            (right (- (+ column width)
                      (window-hscroll))))
        (if (and (&gt; right window-width)
                 (&gt;= right width)
                 (&gt;= column width))
            (setq column (- column width))))
      (if (&gt; ac-menu-direction 0)
          (progn
            (forward-line)
            (if (eq line (line-number-at-pos))
                (newline)
              (forward-line -1))
            (setq ac-menu (ac-menu-create (1+ line) column width ac-candidate-menu-height))
            (setq ac-point point))
        (setq ac-menu (ac-menu-create (- line ac-candidate-menu-height) column width ac-candidate-menu-height))
        (setq ac-point point)))))

(defun ac-cleanup ()
  "<span class="quote">Destroy popup menu.</span>"
  (ac-deactivate-mode-map)
  (when ac-menu
    (ac-menu-delete ac-menu)
    (set-window-start (selected-window) ac-saved-window-start)
    (set-window-hscroll (selected-window) ac-saved-window-hscroll))
  (setq ac-menu nil)
  (setq ac-menu-scroll 0)
  (setq ac-completing nil)
  (setq ac-point nil)
  (setq ac-candidates nil)
  (setq ac-selection 0)
  (setq ac-selection-scroll-top 0)
  (funcall ac-cleanup-function))

(defun ac-activate-mode-map ()
  "<span class="quote">Activate `ac-complete-mode-map'.</span>"
  (if ac-override-local-map
      (progn
        (setq ac-saved-local-map overriding-terminal-local-map)
        (if (eq ac-saved-local-map ac-complete-mode-map)
            <span class="linecomment">;; maybe never reach here</span>
            (setq ac-saved-local-map nil))
        (setq overriding-terminal-local-map ac-complete-mode-map))
    <span class="linecomment">;; rearrange ac-mode-map pair first</span>
    (assq-delete-all 'ac-completing minor-mode-map-alist)
    (push (cons 'ac-completing ac-complete-mode-map) minor-mode-map-alist)))

(defun ac-deactivate-mode-map ()
  "<span class="quote">Deactivate `ac-complete-mode-map'.</span>"
  (when (and ac-override-local-map
             (eq overriding-terminal-local-map ac-complete-mode-map))
    (setq overriding-terminal-local-map ac-saved-local-map)
    (setq ac-saved-local-map nil)))

(defun ac-next ()
  "<span class="quote">Select next candidate.</span>"
  (interactive)
  (if (interactive-p)
      (setq ac-dwim-enable t))
  (if ac-candidates
      (ac-select-candidate
       (let ((selection (1+ ac-selection)))
         (if (= selection (+ ac-menu-offset (min ac-candidate-menu-height (length ac-candidates))))
             (if (&lt; (+ (- ac-selection ac-menu-offset) ac-menu-scroll) (1- (length ac-candidates)))
                 (prog1 ac-selection
                   (setq ac-menu-scroll (1+ ac-menu-scroll))
                   (ac-redraw-candidates))
               (setq ac-menu-scroll 0)
               (ac-redraw-candidates)
               ac-menu-offset)
           selection)))))

(defun ac-previous ()
  "<span class="quote">Select previous candidate.</span>"
  (interactive)
  (if (interactive-p)
      (setq ac-dwim-enable t))
  (if ac-candidates
      (ac-select-candidate
       (let ((selection (1- ac-selection)))
         (if (&lt; selection ac-menu-offset)
             (if (= ac-menu-scroll 0)
                 (prog1 (1- (+ ac-menu-offset (min ac-candidate-menu-height (length ac-candidates))))
                   (setq ac-menu-scroll (- (length ac-candidates) (min ac-candidate-menu-height (length ac-candidates))))
                   (ac-redraw-candidates))
               (setq ac-menu-scroll (1- ac-menu-scroll))
               (ac-redraw-candidates)
               ac-selection)
           selection)))))

(defun ac-expand-1 ()
  "<span class="quote">Try expansion.</span>"
  (let ((string (overlay-get (ac-menu-line-overlay ac-menu ac-selection) 'real-string)))
    (delete-region ac-point (point))
    (insert string)
    (setq ac-prefix string)))

(defun ac-expand ()
  "<span class="quote">Try expansion but select next if expanded twice.</span>"
  (interactive)
  (if (and ac-dwim ac-dwim-enable)
      (ac-complete)
    (let ((target ac-prefix)
          (string (ac-expand-1)))
      (when (equal target string)
        (ac-next)
        (ac-expand-1)))))

(defun ac-expand-common ()
  "<span class="quote">Try expansion common part.</span>"
  (interactive)
  (let ((common (try-completion ac-prefix ac-candidates))
        (buffer-undo-list t))
    (when (stringp common)
      (delete-region ac-point (point))
      (insert common)
      (setq ac-prefix common))))

(defun ac-complete ()
  "<span class="quote">Try completion.</span>"
  (interactive)
  (let* ((candidate (ac-get-selected-candidate))
         (action (ac-get-candidate-action candidate)))
    (ac-expand-1)
    (if action
        (funcall action))
    (ac-abort)))

(defun ac-abort ()
  "<span class="quote">Abort completion.</span>"
  (ac-cleanup))

(defun ac-stop ()
  "<span class="quote">Stop completiong.</span>"
  (interactive)
  (ac-abort))

(defun ac-redraw-candidates ()
  "<span class="quote">Redraw the menu contents.</span>"
  (let ((i ac-menu-offset))
    <span class="linecomment">;; show line and set string to the line</span>
    (mapc
     (lambda (candidate)
       (when (&lt; i ac-candidate-menu-height)
         (ac-menu-show-line ac-menu i)
         (ac-menu-set-line-string ac-menu i candidate
                                  (if (= i ac-selection)
                                      (or (ac-get-candidate-property 'selection-face candidate) 'ac-selection-face)
                                    (or (ac-get-candidate-property 'candidate-face candidate) 'ac-candidate-face)))
         (setq i (1+ i))))
     (nthcdr ac-menu-scroll ac-candidates))
    <span class="linecomment">;; ensure lines visible</span>
    (if (and (&gt; ac-menu-direction 0)
             (&gt; i (-
                   (max 1 (- (window-height)
                             (if mode-line-format 1 0)
                             (if header-line-format 1 0)))
                   (count-lines (window-start) (point)))))
        (recenter (- (1+ i))))
    (if (&gt; i ac-menu-offset)
        (let ((window-width (window-width))
              (right (- (+ (ac-menu-column ac-menu) (ac-menu-width ac-menu))
                        (window-hscroll))))
          (if (&gt; right window-width)
              (scroll-left (- right window-width)))))
    <span class="linecomment">;; hide remaining lines</span>
    (if (&gt; ac-menu-direction 0)
        (while (&lt; i ac-candidate-menu-height)
          (ac-menu-hide-line ac-menu i)
          (setq i (1+ i)))
      (dotimes (i ac-menu-offset)
        (ac-menu-hide-line ac-menu i)))))

(defun ac-update-candidates (candidates)
  "<span class="quote">Update candidates of popup menu.</span>"
  (setq ac-menu-offset (if (&gt; ac-menu-direction 0)
                           0
                         (- ac-candidate-menu-height
                            (min ac-candidate-menu-height
                                 (length candidates)))))
  (setq ac-selection ac-menu-offset)
  (setq ac-candidates candidates)
  (setq ac-dwim-enable (= (length candidates) 1))
  (if candidates
      (progn
        (setq ac-completing t)
        (ac-activate-mode-map))
    (setq ac-completing nil)
    (ac-deactivate-mode-map))
  (ac-redraw-candidates))

(defun ac-get-selected-candidate ()
  (overlay-get (ac-menu-line-overlay ac-menu ac-selection) 'real-string))

(defun ac-get-candidate-action (candidate)
  (ac-get-candidate-property 'action candidate))

(defun ac-propertize-candidate (candidate &rest properties)
  (apply 'propertize candidate properties))

(defun ac-get-candidate-property (prop candidate)
  (get-text-property 0 prop candidate))

(defun ac-select-candidate (selection)
  "<span class="quote">Select candidate pointed by `SELECTION'.</span>"
  (when ac-candidates
    (let ((c1 (nth (+ (- ac-selection ac-menu-offset) ac-menu-scroll) ac-candidates))
          (c2 (nth (+ (- selection ac-menu-offset) ac-menu-scroll) ac-candidates)))
      (ac-menu-set-line-string ac-menu ac-selection c1
                               (or (ac-get-candidate-property 'candidate-face c1)
                                   'ac-candidate-face))
      (ac-menu-set-line-string ac-menu selection c2
                               (or (ac-get-candidate-property 'selection-face c2)
                                   'ac-selection-face))
      (setq ac-selection selection))))

(defun ac-start ()
  "<span class="quote">Start completion.</span>"
  (interactive)
  (let* ((point (save-excursion (funcall ac-prefix-function)))
         (reposition (not (equal ac-point point))))
    (if (null point)
        (ac-abort)
      (setq ac-buffer (current-buffer))
      (setq ac-point point)
      (when (not (equal ac-point ac-old-point))
        (setq ac-old-point point))
      (setq ac-prefix (buffer-substring-no-properties point (point)))
      (setq ac-limit ac-candidate-max)
      (if (or reposition (null ac-menu))
          (save-excursion
            (funcall ac-init-function)))
      (let* ((candidates
              (if (or ac-completing
                      (not (integerp ac-auto-start))
                      (&gt;= (length ac-prefix) ac-auto-start))
                  (save-excursion
                    (funcall ac-candidate-function))))
             (current-width (if ac-menu (ac-menu-width ac-menu) 0))
             (width (let ((w '(0)) s)
                      (dotimes (i ac-candidate-menu-height)
                        (setq s (nth i candidates))
                        (if (stringp s) (push (string-width s) w)))
                      (apply 'max w))))
        (if (or reposition
                (null ac-menu)
                (&gt; width current-width)
                (&lt; width (- current-width 10)))
            (ac-setup-menu point (* (ceiling (/ width 10.0)) 10)))
        (if (and ac-dwim
                 (= (length candidates) 1)
                 (equal (car candidates) ac-prefix)
                 (null (ac-get-candidate-action (car candidates))))
            (setq candidates nil))
        (ac-update-candidates candidates)))))

(defun ac-trigger-command-p ()
  "<span class="quote">Return non-nil if `this-command' is a trigger command.</span>"
  (or (memq this-command ac-trigger-commands)
      (and ac-completing
           (memq this-command
                 '(delete-backward-char
                   backward-delete-char
                   backward-delete-char-untabify)))))

(defun ac-current-physical-column ()
  "<span class="quote">Current physical column. (not logical column)</span>"
  (- (point) (save-excursion (vertical-motion 0) (point))))

(defun ac-on-pre-command ()
  (progn                                <span class="linecomment">; ignore-errors</span>
    (if (and (not (ac-trigger-command-p))
             (or (not (symbolp this-command))
                 (not (string-match "<span class="quote">^ac-</span>" (symbol-name this-command)))))
        (ac-abort))))

(defun ac-on-post-command ()
  (progn                                <span class="linecomment">; ignore-errors</span>
    (if (and (or ac-auto-start
                 ac-completing)
             (not isearch-mode)
             (ac-trigger-command-p))
        (ac-start))))

(defun auto-complete-mode-maybe ()
  "<span class="quote">What buffer `auto-complete-mode' prefers.</span>"
  (if (and (not (minibufferp (current-buffer)))
           (memq major-mode ac-modes))
      (auto-complete-mode 1)))

(require 'easy-mmode)

(define-minor-mode auto-complete-mode
  "<span class="quote">AutoComplete mode</span>"
  :lighter "<span class="quote"> AC</span>"
  :group 'auto-complete
  (if auto-complete-mode
      (progn
        (funcall ac-setup-function)
        (add-hook 'post-command-hook 'ac-on-post-command nil t)
        (add-hook 'pre-command-hook 'ac-on-pre-command nil t)
        (run-hooks 'auto-complete-mode-hook))
    (remove-hook 'post-command-hook 'ac-on-post-command t)
    (remove-hook 'pre-command-hook 'ac-on-pre-command t)
    (ac-abort)))

(define-global-minor-mode global-auto-complete-mode
  auto-complete-mode auto-complete-mode-maybe
  :group 'auto-complete)

 

<span class="linecomment">;;;; Basic cache facility</span>

(defvar ac-clear-variables-after-save nil)

(defun ac-clear-variable-after-save (variable)
  (push variable ac-clear-variables-after-save))

(defun ac-clear-variables-after-save ()
  (dolist (variable ac-clear-variables-after-save)
    (set variable nil)))

 

<span class="linecomment">;;;; Sources implementation</span>

(defvar ac-sources '(ac-source-words-in-buffer)
  "<span class="quote">Sources for completion.

Source takes a form of just function which returns candidates or alist:

init INIT-FUNC
  INIT-FUNC will be called before creating candidate every time.

candidates CANDIDATE-FUNC
  CANDIDATE-FUNC will return a list of string as candidates.
CANDIDATE-FUNC should care about `ac-limit' that is specified at limit for performance.

action ACTION-FUNC
  ACTION-FUNC will be called when `ac-complete' is called.

limit LIMIT-NUM
  A limit of candidates.

requires REQUIRES-NUM
  This source will be included when `ac-prefix' length is larger than REQUIRES-NUM.</span>")
(make-variable-buffer-local 'ac-sources)

(defvar ac-sources-prefix-function 'ac-sources-prefix-default
  "<span class="quote">Default prefix function for sources.
You should override this variable instead of ac-prefix-function.</span>")

(defvar ac-current-sources nil
  "<span class="quote">Current working sources.</span>")

(defvar ac-omni-completion-sources nil
  "<span class="quote">An alist of REGEXP and SOURCES.
If matched regexp, switch to omni-completion mode and
use SOURCES as `ac-sources'.</span>")
(make-variable-buffer-local 'ac-omni-completion-sources)

(defvar ac-sources-omni-completion nil
  "<span class="quote">Non-nil means `auto-complete-mode' is now working on omni-completion.</span>")

(defun ac-sources-setup ()
  "<span class="quote">Implementation for `ac-setup-function' by sources.</span>"
  (make-local-variable 'ac-clear-variables-after-save)
  (add-hook 'after-save-hook 'ac-clear-variables-after-save nil t))

(defun ac-sources-init ()
  "<span class="quote">Implementation for `ac-init-function' by sources.</span>"
  (or ac-current-sources (setq ac-current-sources ac-sources))
  (dolist (source ac-current-sources)
    (let ((init-function (ac-get-source-property 'init source)))
      (if init-function
          (funcall init-function)))))

(defun ac-sources-cleanup ()
  "<span class="quote">Implementation for `ac-cleanup-function' by sources.</span>"
  (setq ac-current-sources nil)
  (setq ac-sources-omni-completion nil))

(defun ac-sources-prefix ()
  "<span class="quote">Implemention for `ac-prefix-function' by sources.</span>"
  (let (point)
    (dolist (pair ac-omni-completion-sources)
      (when (looking-back (car pair))
        (setq ac-current-sources (cdr pair))
        (setq ac-sources-omni-completion t)
        (setq ac-completing t)
        (setq point (match-end 0))))
    (or point
        (if (and ac-completing ac-sources-omni-completion)
            ac-point
          (setq ac-current-sources ac-sources)
          (setq ac-sources-omni-completion nil)
          (funcall ac-sources-prefix-function)))))

(defun ac-sources-prefix-default ()
  "<span class="quote">Default implementation for `ac-sources-prefix-function'.</span>"
  (require 'thingatpt)
  (car-safe (bounds-of-thing-at-point 'symbol)))

(defun ac-sources-candidate ()
  "<span class="quote">Implementation for `ac-cadidates-function' by sources.</span>"
  (let (candidates)
    (dolist (source ac-current-sources)
      (let* ((ac-limit (or (ac-get-source-property 'limit source) ac-limit))
             (requires (ac-get-source-property 'requires source))
             cand)
        (when (or ac-sources-omni-completion
                  (&gt;= (length ac-prefix)
                      (if (integerp requires)
                          requires
                        1)))
          (setq cand
                (delq nil
                      (mapcar (lambda (candidate)
                                (ac-propertize-candidate candidate
                                                         'action (ac-get-source-property 'action source)
                                                         'face (ac-get-source-property 'candidate-face source)
                                                         'candidate-face (ac-get-source-property 'candidate-face source)
                                                         'selection-face (ac-get-source-property 'selection-face source)))
                              (funcall (ac-get-source-property 'candidates source))))))
        (if (and (&gt; ac-limit 1)
                 (&gt; (length cand) ac-limit))
            (setcdr (nthcdr (1- ac-limit) (copy-sequence cand)) nil))
        (setq candidates (append candidates cand))))
    (delete-dups candidates)))

(defun ac-get-source-property (property source)
  (if (symbolp source)
      (setq source (symbol-value source)))
  (if (and (functionp source)
           (eq property 'candidates))
      source
    (if (consp source)
        (assoc-default property source))))

 

<span class="linecomment">;;;; Standard sources</span>

(defun ac-candidate-words-in-buffer ()
  "<span class="quote">Default implemention for `ac-candidate-function'.</span>"
  (if (&gt; (length ac-prefix) 0)
      (let ((i 0)
            candidate
            candidates
            (regexp (concat "<span class="quote">\\b</span>" (regexp-quote ac-prefix) "<span class="quote">\\(\\s_\\|\\sw\\)*\\b</span>")))
        (save-excursion
          <span class="linecomment">;; search backward</span>
          (goto-char ac-point)
          (while (and (&lt; i ac-limit)
                      (re-search-backward regexp nil t))
            (setq candidate (match-string-no-properties 0))
            (unless (member candidate candidates)
              (push candidate candidates)
              (setq i (1+ i))))
          <span class="linecomment">;; search backward</span>
          (goto-char (+ ac-point (length ac-prefix)))
          (while (and (&lt; i ac-limit)
                      (re-search-forward regexp nil t))
            (setq candidate (match-string-no-properties 0))
            (unless (member candidate candidates)
              (push candidate candidates)
              (setq i (1+ i))))
          (nreverse candidates)))))

(defvar ac-source-words-in-buffer
  '((candidates . ac-candidate-words-in-buffer))
  "<span class="quote">Source for completing words in current buffer.</span>")

(defvar ac-word-index nil
  "<span class="quote">Word index for individual buffer.</span>")

(ac-clear-variable-after-save 'ac-word-index)

(defvar ac-source-words-in-all-buffer
  '((init
     . (lambda ()
         (dolist (buffer (buffer-list))
           (with-current-buffer buffer
             (if (not (local-variable-p 'ac-word-index))
                 (make-local-variable 'ac-word-index))
             (if (eq buffer ac-buffer)
                 (setq ac-word-index (ac-candidate-words-in-buffer))
               (if (and (null ac-word-index)
                        (&lt; (buffer-size) 102400))
                   (save-excursion
                     (goto-char (point-min))
                     (while (re-search-forward "<span class="quote">\\b\\(\\s_\\|\\sw\\)+\\b</span>" nil t)
                       (let ((candidate (match-string-no-properties 0)))
                         (if (not (member candidate ac-word-index))
                             (push candidate ac-word-index))))
                     (setq ac-word-index (nreverse ac-word-index)))))))))
    (candidates
     . (lambda ()
         (let ((candidates)
               (buffers (buffer-list)))
           (while (and (&lt; (length candidates) ac-limit)
                       buffers)
             (setq candidates (append candidates (all-completions ac-prefix (buffer-local-value 'ac-word-index (car buffers)))))
             (setq buffers (cdr buffers)))
           candidates))))
  "<span class="quote">Source for completing words in all buffer.</span>")

(defvar ac-source-symbols
  '((candidates
     . (lambda ()
         (all-completions ac-prefix obarray))))
  "<span class="quote">Source for Emacs lisp symbols.</span>")

(defvar ac-source-abbrev
  `((candidates
     . (lambda ()
         (all-completions ac-prefix local-abbrev-table)))
    (action
     . expand-abbrev))
  "<span class="quote">Source for abbrev.</span>")

(defvar ac-source-files-in-current-dir
  '((candidates
     . (lambda ()
         (all-completions ac-prefix (directory-files default-directory)))))
  "<span class="quote">Source for listing files in current directory.</span>")

(defun ac-filename-candidate ()
  (let ((dir (file-name-directory ac-prefix)))
    (ignore-errors
      (delq nil
            (mapcar (lambda (file)
                      (if (not (member file '("<span class="quote">./</span>" "<span class="quote">../</span>")))
                          (concat dir file)))
                    (file-name-all-completions
                     (file-name-nondirectory ac-prefix) dir))))))

(defvar ac-source-filename
  '((candidates . ac-filename-candidate))
  "<span class="quote">Source for completing file name.</span>")

(defvar ac-imenu-index nil
  "<span class="quote">Imenu index.</span>")

(defun ac-imenu-candidate ()
  (require 'imenu)
  (let ((i 0)
        (stack ac-imenu-index)
        candidates
        node)
    (while (and stack
                (&lt; i ac-limit))
      (setq node (pop stack))
      (when (consp node)
        (let ((car (car node))
              (cdr (cdr node)))
          (if (consp cdr)
              (mapc (lambda (child)
                      (push child stack))
                    cdr)
            (when (and (stringp car)
                       (string-match (concat "<span class="quote">^</span>" (regexp-quote ac-prefix)) car))
              (push car candidates)
              (setq i (1+ i)))))))
    (nreverse candidates)))

(defvar ac-source-imenu
  '((init
     . (lambda ()
         (require 'imenu)
         (setq ac-imenu-index
               (ignore-errors (imenu--make-index-alist)))))
    (candidates . ac-imenu-candidate))
  "<span class="quote">Source for imenu.</span>")

(defmacro ac-define-dictionary-source (name list)
  "<span class="quote">Define dictionary source named `NAME'.
`LIST' is a list of string.
This is useful if you just want to define a dictionary/keywords source.</span>"
  `(defvar ,name
     '((candidates . (lambda () (all-completions ac-prefix ,list))))))

 

<span class="linecomment">;;;; Popup menu</span>

(defun ac-menu-line (menu)
  "<span class="quote">Line number of `MENU'.</span>"
  (nth 0 menu))

(defun ac-menu-column (menu)
  "<span class="quote">Column of `MENU'.</span>"
  (nth 1 menu))

(defun ac-menu-width (menu)
  "<span class="quote">Popup menu width of `MENU'.</span>"
  (nth 2 menu))

(defun ac-menu-height (menu)
  "<span class="quote">Popup menu height of `MENU'.</span>"
  (nth 3 menu))

(defun ac-menu-overlays (menu)
  "<span class="quote">Overlays that `MENU' contains.</span>"
  (nth 4 menu))

(defun ac-menu-line-overlay (menu line)
  "<span class="quote">Return a overlay of `MENU' at `LINE'.</span>"
  (aref (ac-menu-overlays menu) line))

(defun ac-menu-hide-line (menu line)
  "<span class="quote">Hide `LINE' in `MENU'.</span>"
  (let ((overlay (ac-menu-line-overlay menu line)))
    (overlay-put overlay 'invisible nil)
    (overlay-put overlay 'after-string nil)))

(defun ac-menu-show-line (menu line)
  "<span class="quote">Show `LINE' in `MENU'.</span>"
  (let ((overlay (ac-menu-line-overlay menu line)))
    (overlay-put overlay 'invisible t)))

(defun ac-menu-set-line-string (menu line string &optional face)
  "<span class="quote">Set contents of `LINE' in `MENU'.</span>"
  (let ((overlay (ac-menu-line-overlay menu line)))
    (overlay-put overlay 'real-string string)
    (funcall (overlay-get overlay 'set-string-function) menu overlay string face)))

(defun ac-menu-create-line-string (menu string)
  "<span class="quote">Adjust `STRING' into `MENU'.</span>"
  (let ((length 0)
        (width 0)
        (menu-width (ac-menu-width menu))
        (chars (append string nil)))
    (while (and
            chars
            (&lt;= (setq width (+ width (char-width (car chars)))) menu-width))
      (setq length (1+ length))
      (setq chars (cdr chars)))
    (if (&lt; length (length string))
        (setq string (substring string 0 length)))
    (let ((string-width (string-width string)))
      (if (&lt; string-width menu-width)
          (setq string (concat string
                               (make-string (- menu-width string-width) ? )))))
    string))

(defun ac-menu-hide (menu)
  "<span class="quote">Hide `MENU'.</span>"
  (dotimes (i (ac-menu-height menu))
    (ac-menu-hide-line menu i)))

(defun ac-menu-last-line-of-buffer ()
  (save-excursion
    (not (eq (forward-line) 0))))

(defun ac-menu-create (line column width height)
  "<span class="quote">Create popup menu.</span>"
  (save-excursion
    (let ((overlays (make-vector height nil))
          (window (selected-window)))
      (goto-line line)
      (dotimes (i height)
        (move-to-column column)
        (let (overlay begin w current-column (prefix "<span class="quote"></span>") (postfix "<span class="quote"></span>"))
          (setq current-column (current-column))
          (cond
           ((&gt; current-column column)
            (backward-char)
            (setq current-column (current-column))
            (if (&lt; current-column column)
                (setq prefix (make-string (- column current-column) ? ))))
           ((&lt; current-column column)
            (setq prefix (make-string (- column current-column) ? ))))

          (setq begin (point))
          (setq w (+ width (length prefix)))
          (while (and (not (eolp))
                      (&gt; w 0))
            (setq w (- w (char-width (char-after))))
            (forward-char))
          (if (&lt; w 0)
              (setq postfix (make-string (- w) ? )))
          (if (ac-menu-last-line-of-buffer)
              (setq postfix (concat postfix "<span class="quote">\n</span>")))

          (setq overlay (make-overlay begin (point)))
          (overlay-put overlay 'window window)
          (overlay-put overlay 'prefix prefix)
          (overlay-put overlay 'postfix postfix)
          (overlay-put overlay 'width width)
          (overlay-put overlay 'set-string-function
                       (lambda (menu overlay string &optional face)
                         (overlay-put overlay
                                      'after-string
                                      (concat (overlay-get overlay 'prefix)
                                              (propertize (ac-menu-create-line-string menu string) 'face face)
                                              (overlay-get overlay 'postfix)))))
          (aset overlays i overlay))
        (forward-line))
      (let ((i 100))
        (mapc (lambda (overlay)
                (overlay-put overlay 'priority i)
                (setq i (1+ i)))
              (nreverse (append overlays nil))))
      (list line column width height overlays))))

(defun ac-menu-delete (menu)
  "<span class="quote">Delete `MENU'.</span>"
  (mapcar 'delete-overlay (ac-menu-overlays menu)))

(provide 'auto-complete)
<span class="linecomment">;;; auto-complete.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=auto-complete.el;missing=de_en_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local" href="http://www.emacswiki.org/emacs/Comments_on_auto-complete.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=auto-complete.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=auto-complete.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=auto-complete.el">Administration</a></span><!-- test --><span class="time"><br /> Last edited 2009-03-19 06:18 UTC by <a class="author" title="from ckp0.ariel-networks.com" href="http://www.emacswiki.org/emacs/Matsuyama">Matsuyama</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=auto-complete.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>

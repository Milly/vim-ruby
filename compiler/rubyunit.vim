" Vim compiler file
" Language:	Test::Unit - Ruby Unit Testing Framework
" Maintainer:	Doug Kearns <djkea2 at mugca.its.monash.edu.au>
" Info:		$Id: rubyunit.vim,v 1.4 2004/09/04 10:30:13 dkearns Exp $
" URL:		http://vim-ruby.sourceforge.net
" Anon CVS:	See above site
" Licence:	GPL (http://www.gnu.org)
" Disclaimer:
"    This program is distributed in the hope that it will be useful,
"    but WITHOUT ANY WARRANTY; without even the implied warranty of
"    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"    GNU General Public License for more details.
" ----------------------------------------------------------------------------

if exists("current_compiler")
  finish
endif
let current_compiler = "rubyunit"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=ruby

CompilerSet errorformat=\%Etest%[%^\ ]%#(%[%^\ ]%#)\ [%f:%l]:,
			\%E\ %\\+%f:%l:in\ %.%#,
			\%Z%m%\\%.,
			\%C%m%\\%.,
			\%-GLoaded%.%#,
			\%-GStarted%.%#,
			\%-G%[EF%.]%.%#,
			\%-GFinished\ in%.%#,
			\%-G\ %\\+%\\d%\\+)\ Failure:,
			\%-G\ %\\+%\\d%\\+)\ Error:

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap ts=8 ff=unix
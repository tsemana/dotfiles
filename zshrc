# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi="vim"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PATH=/usr/local/bin:/usr/bin:/usr/sbin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/ok/bin # Path to ok script

# GC Tuning from
# http://labs.goclio.com/tuning-ruby-garbage-collection-for-rspec/
# http://www.web-l.nl/posts/15-tuning-ruby-s-garbage-collector-with-rvm-and-passenger

# # RUBY_HEAP_MIN_SLOTS is the number of objects that the starting heap can hold.
# # We want this number to be larger than :heap_live_num. 1,500,000 was the ceiling
# # for performance gains; beyond that, bumping it further didn’t do anything, which
# # indicates that our live object count probably didn’t get too far beyond that.
# # But let’s future-proof things a bit and make it bigger anyhow.
# # (Not like I’m short on memory, right?)
# # export RUBY_HEAP_MIN_SLOTS=2000000 #2 000 000, 37Signals 600 000
# export RUBY_HEAP_MIN_SLOTS=800000 #Sam Saffron (Discourse)
# 
# # RUBY_HEAP_FREE_MIN controls how often new heaps get allocated. If the collector
# # does a complete cycle but there’s still fewer than this number of slots available,
# # it’ll create a new heap. In general, you want this number to be around
# # 1% of RUBY_HEAP_MIN_SLOTS; any lower, and you’ll start getting emergency “oh crap,
# # we need to stop everything and allocate a new heap” moments in between GC cycles,
# # but any higher and you’ll start allocating heaps more often.
# # (My testing seemed to confirm that 1% was the sweet spot.)
# # export RUBY_HEAP_FREE_MIN=20000 #20 000, 37Signals 100 000
# export RUBY_FREE_MIN=600000 #SS
# 
# # RUBY_HEAP_SLOTS_INCREMENT is the number of object slots in a newly created heap.
# # The conventional wisdom is that this should be about 8 to 10 percent of
# # RUBY_HEAP_MIN_SLOTS; lower, and you’ll allocate heaps too often; higher, and
# # you’ll end up allocating slots you never use. My testing showed a very slight
# # improvement from bumping this up to 20%, but it was almost line noise.
# # export RUBY_HEAP_SLOTS_INCREMENT=200000
# 
# # RUBY_HEAP_SLOTS_GROWTH_FACTOR is the amount by which Ruby will multiply
# # RUBY_HEAP_SLOTS_INCREMENT every time it allocates a heap beyond the second.
# # The default value for this — 1.8 — is just dumb. Basically, every time Ruby creates
# # a new heap, it’s 80% larger than the last one, so when your memory usage finally
# # plateaus, you’ll probably have massively over-allocated. We just set this to 1,
# # so that it always uses RUBY_HEAP_SLOTS_INCREMENT for every new heap; it’s a lot
# # better to just tune the heap size and leave this “feature” alone.
# # export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
# export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1.25 #SS
# 
# # RUBY_GC_MALLOC_LIMIT controls the garbage collection for C data structures that
# # don’t live on the heap; after this many mallocs, it’ll trigger a GC cycle.
# # The default is 8 million, which is stupid low, and tends to frequently run the
# # GC when it’s not necessary. Raising this has a significant effect; I found that
# # 1 billion (!) was the point beyond which I didn’t see any further performance
# # improvements.
# # export RUBY_GC_MALLOC_LIMIT=100000000 #100 000 000, 37Signals 59 000 000
# export RUBY_GC_MALLOC_LIMIT=1000000000 #SS
# 

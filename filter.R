
library(quantmod)


new_env <- new.env()
symbols <- c("YHOO", "GOOG")
retrieved_symbols <- getSymbols(symbols, env=new_env, warnings = FALSE)
ll <- eapply(new_env, function(x) x)  
for (s in ll){
  print(s)
}
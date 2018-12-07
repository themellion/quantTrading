library('BatchGetSymbols')
library('ggplot2')

first.date <- Sys.Date() - 60
last.date <- Sys.Date()
freq.data <- 'daily'

# set tickers
# tickers <- c('FB','MMM','PETR4.SA','abcdef') # Facebook, Petrobras, 3M
# 
# l.out <- BatchGetSymbols(tickers = tickers, 
#                          first.date = first.date,
#                          last.date = last.date, 
#                          freq.data = freq.data,
#                          cache.folder = file.path(tempdir(), 
#   'BGS_Cache') ) # cache in tempdir()
# 
# print(l.out)

# p <- ggplot(l.out$df.tickers, aes(x = ref.date, y = price.close))
# p <- p + geom_line()
# p <- p + facet_wrap(~ticker, scales = 'free_y') 
# print(p)

# download data for MARUTI ~ i.e. MARUTI.NS
myTicker <- 'MARUTI.NS'
l.out <- BatchGetSymbols(tickers = myTicker, 
                         first.date = '2008-01-01',
                         last.date = '2013-12-31', 
                         freq.data = 'daily',
                         cache.folder = file.path(tempdir(), 
                                                  'BGS_Cache') ) # cache in tempdir()

# keep specific columns
stockDF <- l.out$df.tickers[, c('ref.date', 'price.open', 'price.high', 'price.low', 'price.close', 'volume')]

p <- ggplot(stockDF, aes(x = ref.date, y = price.close))
p <- p + geom_line() + xlab('Date') + ylab('Closing Price') + ggtitle('MARUTI (MARUTI.NS)')
print(p)

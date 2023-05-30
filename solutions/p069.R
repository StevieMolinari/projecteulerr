## p069 takes 3.8 minutes;
### incorrectly provides 571787; correct answer 510510
start = Sys.time()
numbers = 2:10^6
which.max(numbers/sapply(numbers, euler_totient))+1
end = Sys.time()
end-start

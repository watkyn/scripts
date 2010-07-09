(ns watkyn
  (:require clojure.contrib.test-is))

(defn puts [message] (println message))

(puts (.toUpperCase "hello"))
(puts (+ 1 2 3))


(defn square [x] (* x x))

(defn sum-of-squares [x, y] 
  (+ (square x) (square y)))

(puts (square 89))
(puts (sum-of-squares 2 3))

(defn abs [x]
  (cond 
    (> x 0) x
    (< x 0) (- x)))

(puts (abs -5))        
(puts (abs 0))        





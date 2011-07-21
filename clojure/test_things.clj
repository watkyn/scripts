(ns clojure.contrib.test-math
  (:use clojure.test
   clojure.contrib.math))

(deftest test-expt
  (are [x y] (= x y)
      (expt 2 3) 8
      (expt (expt 2 16) 2) (expt 2 32)
      (expt 4/3 2) 16/9
      (expt 2 -10) 1/1024
      (expt 0.5M 2) 0.25M
      (expt 5 4.2) (Math/pow 5 4.2)
      (expt 5.3 4) (Math/pow 5.3 4)))


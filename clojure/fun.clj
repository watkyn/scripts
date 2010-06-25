(println (.toUpperCase "hello"))
(println (+ 1 2 3))


(defn square [x] (println(* x x)))

(defn sum-of-squares [x, y] 
  (println(+ (square x) (square y) )))

(square 21)
(sum-of-squares 2 3)


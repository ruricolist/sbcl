(defsystem "sb-sprof"
  :description "A statistical profiler."
  #+sb-building-contrib :pathname
  #+sb-building-contrib #p"SYS:CONTRIB;SB-SPROF;"
  :components ((:file "sb-sprof"))
  :perform (load-op :after (o c) (provide 'sb-sprof))
  :in-order-to ((test-op (test-op "sb-sprof/tests"))))

(defsystem "sb-sprof/tests"
  :depends-on ("sb-sprof")
  :components ((:file "test"))
  :perform (test-op (o c)
             #-(or win32 darwin) ;not yet
             (or (funcall (find-symbol "RUN-TESTS" "SB-SPROF-TEST"))
                 (error "test-op failed"))))
steroids.logger.queue.autoFlush
===============================

    steroids.logger.queue.autoFlush(100)

Description
-----------

Set the message queue to automatically relay messages to `logger.logEndpoint`. Calls `steroids.logger.queue.startFlushing` internally after checking for app type. Automatic flushing is enabled by default.

Parameters
----------

- __interval__: The interval (in milliseconds) with which to flush the message queue

Return values
-------------

- __success__: Boolean, returns false if called from non-Scanner app, otherwise the result of `steroids.logger.queue.startFlushing`


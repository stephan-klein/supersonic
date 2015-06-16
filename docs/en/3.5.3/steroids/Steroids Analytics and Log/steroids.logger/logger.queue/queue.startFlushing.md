steroids.logger.queue.startFlushing
===================================

    steroids.logger.queue.startFlushing(100)

Description
-----------

Set the message queue to automatically relay messages to `logger.logEndpoint`. Automatic flushing is enabled by default.

Parameters
----------

- __interval__: The interval (in milliseconds) with which to flush the message queue

Return values
-------------

- __success__: Boolean, returns false if flushing is already enabled, true otherwise


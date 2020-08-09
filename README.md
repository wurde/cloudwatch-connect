# CloudWatch Dashboard for Connect

Amazon Connect sends data to CloudWatch metrics that can be
displayed in a singular Dashboard for monitoring. Example
operational metrics include:

- **CallsBreachingConcurrencyQuota** - total number of voice
    calls that exceeded the concurrent calls quota.
- **ConcurrentCallsPercentage** - percentage of the concurrent
    active voice calls service quota used.
- **LongestQueueWaitTime** - longest amount of time, in seconds,
    that a contact waited in a queue.
- **QueueSize** - number of contacts in the queue.
- **QueueCapacityExceededError** - number of calls rejected
    because the queue was full.
- **ThrottledCalls** - number of voice calls rejected
    because the rate of calls per second exceeded the max.

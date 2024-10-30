

A/B Test Name: Progress Bar Size in Goal Completion Tracker
User Story Number: US4 (Goal Progress Visualization)
Metrics:
Engagement: Percentage of users who interact with the tracker.
Retention: Percentage of users who return to check their progress over a 7-day period.
Task Success: Rate of goal completion among users who view the progress bar.
Satisfaction: User satisfaction score from post-interaction surveys.
Hypothesis:
A larger progress bar will encourage users to interact with the tracker and increase their goal completion rate by providing a more visually impactful representation of progress, while a smaller, more minimal progress bar may provide an unobtrusive experience that allows users to focus on other app features.

What Problem Are We Trying to Solve? Its Impact?
Problem: Users may feel less engaged or motivated to pursue their sustainability goals if the progress bar is too small and understated or too large and obtrusive, impacting overall goal completion. Impact: Improving engagement with the progress bar could significantly boost retention, as users are more likely to return to track their goals. By optimizing the progress bar size, the app can strike the right balance between usability and motivation.

Experiment:
Audience: We’ll target 50% of the user base for the experiment, with a 50/50 split between the two progress bar sizes.
Tracking: Using Firebase Analytics, set up event tracking for:
Interactions with the progress bar (e.g., clicks, time spent viewing).
The completion rate for tracked goals.
Session frequency for users in each group.
Post-interaction satisfaction feedback (optional).
Variations:
Variation A - Large Progress Bar: A larger progress bar at the top of the goal-tracking screen, with bold percentage numbers.

Mockup: A wide, colorful bar spanning 80% of the screen width and visually prominent, with percentage text overlaid.
Variation B - Small Progress Bar: A smaller, minimal progress bar located underneath the goal text.

Mockup: A narrow, subtle progress bar beneath the goal description, with smaller, right-aligned percentage text.



A/B Test Name: App Rating and Recommendation Survey Button Placement

User Story Number: US4

Metrics:
Happiness Metric: Average app rating score (1-5 scale).
Happiness Metric: Average recommendation rating score (1-10 scale).

Hypothesis:
If we present the app rating (1-5 scale) and the recommendation likelihood (1-10 scale) survey immediately after a user logs a goal, we expect higher completion rates and more positive feedback, as users may feel a sense of achievement. Conversely, presenting the survey after logout may lead to lower engagement and less thoughtful responses.
What problem are we trying to solve? Its impact?
We currently lack insight into user satisfaction with our app and their likelihood to recommend it to others. If users feel less inclined to provide ratings after logging out, we may miss out on valuable insights. Understanding user satisfaction is crucial for app retention and growth, making this an important area to address.

Experiment:
We will conduct an A/B test via Firebase, where 50% of users will receive the survey immediately after logging a goal, while the other 50% will see it after logging out. This random assignment will help us evaluate which timing yields better feedback collection.

Tracking using Firebase Analytics:
We will track the following:
App Rating Score: Average score given by users (1-5 scale) in both groups.
Recommendation Likelihood: Average score of how likely users are to recommend the app (1-10 scale).

Variations:

Variation A: Survey after logging a goal (users will be directed to the survey page, asking for app rating and likelihood to recommend the app immediately after logging their goal).

Mockup: A survey page appears after user logs a goal, prompting users to rate the app (1-5 scale) and indicate their likelihood of recommending it to a friend (1-10 scale).

Variation B: Survey after logging out (users are prompted to rate the app and indicate their recommendation likelihood upon logging out).

Mockup: A survey page appears after user logged out, prompting users to rate the app (1-5 scale) and indicate their likelihood of recommending it to a friend (1-10 scale).




A/B Test Name: Log Goal Button Location
User Story Number: US4 (Goal Progress Visualization) 
Metrics: Engagement: Percentage of users who interact with the button. 
Retention: Percentage of users who return to check their progress over a 7-day period. 
Task Success: Rate of clicks on the Log Goal button. 
Satisfaction: User satisfaction score from post-interaction surveys. 
Hypothesis: 
A log goal button that not included on the main screen could be more intuitive, as it is directly designed as a button that would draw that user's attention to adding something better than a text button would.

What Problem Are We Trying to Solve? Its Impact? 
Problem: Users may be confused by what logging a goal means, and would likely have a better understanding of the simple floating icon button rather than a dedicated log goal button.
Impact: Improving the button location and style could help with user retention in the sense that it would be easier to log their goals.

Experiment:
Audience: We shall target 50% of the user base for the experiment, with a 50/50 split between the two progress bar sizes.
Tracking: Using Firebase Analytics, set up event tracking for:
Interactions with the button.
Post-interaction satisfaction feedback (optional).
Variations:
Variation A - A Log Goal button that appears in a row conjunction to the New Goal and Edit Goal buttons.

Mockup: A 40x40 approximate rounded box button that is identical to the rest of buttons on the row.

Variation B - A Log Goal button that is detached from the actual screen, and has a plus on it.
Mockup: A smaller floating button on the right hand corner of the screen, similar color scheme.


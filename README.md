# README

This intention behind this repo is to create an interface for 
users to create comments and update the status of a projects.

The app should list both comments and status updates under a project.


## Tivity

Tivity is the mechanism which records the activities of a class.

Tivity allows us to record all the events on a particular model. The activities could be events that happen on the model itself or an association of the model.


Say we want to `activitise` the Project model. When something changes on the Project model we will create an activity event for that.

```ruby
Project.update(status: 'off')
```

This operation will create an Activity record describing what happened.

```ruby
Activity.create(activiable_type: 'Project', activiable_id: 1, description, activised_type: nil, activised_id: nil, event: '{change: {status: {from: 'on', to: 'off'}}')
```



```ruby
Activity.create(activiable_type: 'Project', activiable_id: 1, description, activised_type: 'Comment', activised_id: 1, event: :create)
```

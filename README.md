# README

This intention behind this repo is to create an interface for 
users to create comments and update the status of a projects.

The app should list both comments and status updates under a project.


## Tivity

Tivity is the mechanism which records the activities of a class.

Tivity allows us to record all the events on a particular model. The activities could be events that happen on the model itself or an association of the model.

Obvious events are `created`, `updated`, `destroyed`.
We probably don't care about the state of all properties on the model when `created` or `destroyed`. When the model is `updated`, we probably want to know what changed.
In fact, this is not about auditing, so destoyed is not interesting at all. If the project is destroyed, we don't want to keep a record of it.


Say we want to `activitise` the Project model. When a Project is created, we create an activity that the model was created.

**Create**

```ruby
class Project

activity create: true
```

```ruby
Project.create(name: 'p1', status: 'off')
---
Activity.create(activiable_type: 'Project', activiable_id: 1, operation: :created)
```

**Update**

When the project is updated, we want the activity to record what changed.
```ruby
class Project

activity update: true
```

```ruby
Project.update(status: 'off')
---
Activity.create(activiable_type: 'Project', activiable_id: 1, operation: :updated, diff: "{status: ['on', 'off']")
```

Collect activity on an association

```ruby
class Comment
  activities create: true, for: :project
end
```

This operation will create an `Activity` record describing what happened.

```ruby
Activity.create(activiable_type: 'Project', activiable_id: 1, description, activised_type: Comment, activised_id: 1)
```


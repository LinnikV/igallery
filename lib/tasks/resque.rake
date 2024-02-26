# frozen_string_literal: true

require 'resque'
require 'resque/tasks'
task 'resque:setup' => :environment

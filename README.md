`refined` is a technique for chaining scopes (or class methods as it were in rails (see http://elabs.se/blog/24-scopes-are-obsolete/ "Scopes Are Obsolete") to facilitate easy filtering of ActiveRecord collections.

Installation
============

    gem install refined

### When used with Rails 3

in a `Gemfile`:

    gem 'refined'

Example Use
===========

### Simple collection scoping

This is not a super practical use but one could do:

    Candidate.refined({status: "pending", skill: "advanced"})

However that's not much shorter than:

    Candidate.where("status = ? OR skill = ?", "pending", "advanced")

### A Simple View Filter

Let's say you want to filter a list of candidates for hire by status and skill level. The code might look something like this.

    class Candidate < ActiveRecord::Base; end

    controller Candidates < ApplicationController
      expose(:candidates) { Candidate.refined(params[:filters]) }

      def filter
        render :index
      end
    end

    = form_for :filters, url: filter_candidates_url do |f|
      %fieldset
        %dl
          %dt Status
          %dd= f.select :status, ["pending", "hired", "rejected"]
      
          %dt Skill
          %dd= f.select :skill, ["beginner", "intermediate", "advanced"]
      %fieldset.action
        = f.submit "Filter"

    %table
      %thead
        %tr
          - ["Name", "Status", "Skill"].each do |header|
            %th header
      %tbody
        - candidates.each do |candidate|
          %tr
            %td= candidate.name
            %td= candidate.status
            %td= candidate.skill

The call to Candidate.refined(params[:filters]) will yield 2 class methods created on Candidate as such:

    def self.status(arg)
      where(status: arg)
    end

    def self.skill(arg)
      where(skill: arg)
    end

And will chain those methods as `Candidate.status("pending").skill("advanced")` returning the scoped collection of candidates.

### TODO

- Rails 2 support
- Ruby 1.8 support
- Multiple parameters
- More AREL finder methods
- Accessor methods for parameter values

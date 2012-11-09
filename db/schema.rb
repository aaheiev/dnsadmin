# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121109111530) do

  create_table "app_services", :force => true do |t|
    t.string  "name"
    t.integer "app_id"
    t.string  "ip",     :limit => 16
    t.integer "prio",                 :default => 0
    t.boolean "active",               :default => true
    t.string  "status",               :default => "UP"
  end

  add_index "app_services", ["active"], :name => "index_app_services_on_active"
  add_index "app_services", ["app_id"], :name => "index_app_services_on_app_id"
  add_index "app_services", ["ip"], :name => "index_app_services_on_ip"
  add_index "app_services", ["status"], :name => "index_app_services_on_status"

  create_table "apps", :force => true do |t|
    t.string  "name"
    t.integer "domain_id"
    t.string  "app_type"
    t.string  "access_scope",   :default => "public", :null => false
    t.string  "ssl_type"
    t.boolean "active",         :default => true
    t.string  "http_auth_user"
    t.string  "http_auth_pass"
    t.text    "comments"
  end

  add_index "apps", ["app_type"], :name => "index_apps_on_app_type"
  add_index "apps", ["domain_id"], :name => "index_apps_on_domain_id"

  create_table "domain_statuses", :force => true do |t|
    t.string "title", :null => false
  end

  add_index "domain_statuses", ["title"], :name => "index_domain_statuses_on_title", :unique => true

  create_table "domain_types", :force => true do |t|
    t.string "title", :null => false
  end

  add_index "domain_types", ["title"], :name => "index_domain_types_on_domain_type", :unique => true

  create_table "domains", :force => true do |t|
    t.string   "name",                                                  :null => false
    t.integer  "provider_id"
    t.integer  "domain_type_id"
    t.integer  "domain_status_id"
    t.date     "expiration_date"
    t.integer  "dns_domain_id"
    t.string   "master",           :limit => 128
    t.integer  "last_check"
    t.string   "type",             :limit => 10,  :default => "NATIVE", :null => false
    t.string   "notified_serial"
    t.string   "account",          :limit => 40
    t.text     "comments"
    t.boolean  "active",                          :default => true
    t.boolean  "in_dns",                          :default => false
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "domains", ["active"], :name => "index_domains_on_active"
  add_index "domains", ["domain_status_id"], :name => "domain_status_id"
  add_index "domains", ["domain_type_id"], :name => "index_domains_on_domain_type_id"
  add_index "domains", ["in_dns"], :name => "index_domains_on_in_dns"
  add_index "domains", ["name"], :name => "index_domains_on_name", :unique => true
  add_index "domains", ["provider_id"], :name => "index_domains_on_provider_id"

  create_table "host_roles", :force => true do |t|
    t.string "title",       :null => false
    t.string "description"
  end

  add_index "host_roles", ["title"], :name => "index_host_roles_on_title", :unique => true

  create_table "host_to_roles", :id => false, :force => true do |t|
    t.integer "host_id",      :null => false
    t.integer "host_role_id", :null => false
  end

  add_index "host_to_roles", ["host_id"], :name => "index_host_to_roles_on_host_id"
  add_index "host_to_roles", ["host_role_id"], :name => "index_host_to_roles_on_host_role_id"

  create_table "hosts", :force => true do |t|
    t.string   "name",                                                                           :null => false
    t.string   "ip",               :limit => 16
    t.integer  "provider_id",                                                                    :null => false
    t.string   "location"
    t.string   "hw_type"
    t.string   "prod_number"
    t.string   "billing_number"
    t.decimal  "price_per_mon",                  :precision => 5, :scale => 2, :default => 0.0
    t.string   "operating_system"
    t.boolean  "active"
    t.boolean  "available"
    t.datetime "created_at",                                                                     :null => false
    t.datetime "updated_at",                                                                     :null => false
    t.string   "hoststate",                                                    :default => "UP"
  end

  add_index "hosts", ["active"], :name => "index_hosts_on_active"
  add_index "hosts", ["hoststate"], :name => "index_hosts_on_hoststate"
  add_index "hosts", ["ip"], :name => "index_hosts_on_ip", :unique => true
  add_index "hosts", ["name"], :name => "index_hosts_on_name", :unique => true
  add_index "hosts", ["provider_id"], :name => "index_hosts_on_provider_id"

  create_table "ip_addresses", :primary_key => "ip", :force => true do |t|
    t.integer "host_id",                       :null => false
    t.boolean "is_primary", :default => false
    t.boolean "active",     :default => true
  end

  add_index "ip_addresses", ["active"], :name => "index_ip_addresses_on_active"
  add_index "ip_addresses", ["host_id"], :name => "index_ip_addresses_on_host_id"
  add_index "ip_addresses", ["ip"], :name => "index_ip_addresses_on_ip", :unique => true

  create_table "nagios_statuses", :force => true do |t|
    t.integer  "statusable_id"
    t.string   "statusable_type"
    t.integer  "monitor_id"
    t.string   "event_type"
    t.string   "event_status"
    t.string   "event_message"
    t.datetime "event_time"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "nagios_statuses", ["created_at"], :name => "index_nagios_statuses_on_created_at"
  add_index "nagios_statuses", ["monitor_id"], :name => "index_nagios_statuses_on_monitor_id"
  add_index "nagios_statuses", ["statusable_id"], :name => "index_nagios_statuses_on_statusable_id"

  create_table "providers", :force => true do |t|
    t.string   "title",       :null => false
    t.string   "site_url"
    t.string   "cp_url"
    t.string   "cp_username"
    t.string   "cp_password"
    t.string   "email"
    t.text     "comments"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "providers", ["title", "cp_username"], :name => "index_providers_on_title_and_cp_username", :unique => true

  create_table "records", :force => true do |t|
    t.integer "domain_id",                 :null => false
    t.string  "name"
    t.string  "type",        :limit => 10
    t.text    "content"
    t.integer "ttl"
    t.integer "prio"
    t.integer "change_date"
    t.string  "ordername"
    t.boolean "auth"
  end

  add_index "records", ["domain_id"], :name => "index_records_on_domain_id"
  add_index "records", ["name", "type"], :name => "index_records_on_name_and_type"
  add_index "records", ["name"], :name => "index_records_on_name"
  add_index "records", ["ordername"], :name => "index_records_on_ordername"

  create_table "supermasters", :force => true do |t|
    t.string "ip",         :limit => 16
    t.string "nameserver"
    t.string "account",    :limit => 40
  end

  create_table "tasks", :force => true do |t|
    t.boolean  "done",       :default => false
    t.string   "name",                          :null => false
    t.text     "notes"
    t.integer  "priority",   :default => 0
    t.date     "due"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "tasks", ["name"], :name => "index_tasks_on_name"

end

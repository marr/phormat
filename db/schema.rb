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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "4images_categories", primary_key: "cat_id", force: :cascade do |t|
    t.string  "cat_name",          limit: 255,   default: "", null: false
    t.text    "cat_description",   limit: 65535,              null: false
    t.integer "cat_parent_id",     limit: 3,     default: 0,  null: false
    t.integer "cat_hits",          limit: 2,     default: 0,  null: false
    t.integer "cat_order",         limit: 3,     default: 0,  null: false
    t.integer "auth_viewcat",      limit: 1,     default: 0,  null: false
    t.integer "auth_viewimage",    limit: 1,     default: 0,  null: false
    t.integer "auth_download",     limit: 1,     default: 0,  null: false
    t.integer "auth_upload",       limit: 1,     default: 0,  null: false
    t.integer "auth_directupload", limit: 1,     default: 0,  null: false
    t.integer "auth_vote",         limit: 1,     default: 0,  null: false
    t.integer "auth_sendpostcard", limit: 1,     default: 0,  null: false
    t.integer "auth_readcomment",  limit: 1,     default: 0,  null: false
    t.integer "auth_postcomment",  limit: 1,     default: 0,  null: false
  end

  add_index "4images_categories", ["cat_order"], name: "cat_order", using: :btree
  add_index "4images_categories", ["cat_parent_id"], name: "cat_parent_id", using: :btree

  create_table "4images_comments", primary_key: "comment_id", force: :cascade do |t|
    t.integer "image_id",         limit: 3,     default: 0,  null: false
    t.integer "user_id",          limit: 3,     default: 0,  null: false
    t.string  "user_name",        limit: 100,   default: "", null: false
    t.string  "comment_headline", limit: 255,   default: "", null: false
    t.text    "comment_text",     limit: 65535,              null: false
    t.string  "comment_ip",       limit: 20,    default: "", null: false
    t.integer "comment_date",     limit: 4,     default: 0,  null: false
  end

  add_index "4images_comments", ["comment_date"], name: "comment_date", using: :btree
  add_index "4images_comments", ["image_id"], name: "image_id", using: :btree
  add_index "4images_comments", ["user_id"], name: "user_id", using: :btree

  create_table "4images_groupaccess", id: false, force: :cascade do |t|
    t.integer "group_id",          limit: 3, default: 0,     null: false
    t.integer "cat_id",            limit: 3, default: 0,     null: false
    t.boolean "auth_viewcat",                default: false, null: false
    t.boolean "auth_viewimage",              default: false, null: false
    t.boolean "auth_download",               default: false, null: false
    t.boolean "auth_upload",                 default: false, null: false
    t.boolean "auth_directupload",           default: false, null: false
    t.boolean "auth_vote",                   default: false, null: false
    t.boolean "auth_sendpostcard",           default: false, null: false
    t.boolean "auth_readcomment",            default: false, null: false
    t.boolean "auth_postcomment",            default: false, null: false
  end

  add_index "4images_groupaccess", ["cat_id"], name: "cat_id", using: :btree
  add_index "4images_groupaccess", ["group_id"], name: "group_id", using: :btree

  create_table "4images_groupmatch", id: false, force: :cascade do |t|
    t.integer "group_id",             limit: 3, default: 0, null: false
    t.integer "user_id",              limit: 3, default: 0, null: false
    t.integer "groupmatch_startdate", limit: 4, default: 0, null: false
    t.integer "groupmatch_enddate",   limit: 4, default: 0, null: false
  end

  add_index "4images_groupmatch", ["group_id"], name: "group_id", using: :btree
  add_index "4images_groupmatch", ["user_id"], name: "user_id", using: :btree

  create_table "4images_groups", primary_key: "group_id", force: :cascade do |t|
    t.string  "group_name", limit: 100, default: "", null: false
    t.integer "group_type", limit: 1,   default: 1,  null: false
  end

  create_table "4images_images", primary_key: "image_id", force: :cascade do |t|
    t.integer "cat_id",               limit: 3,                             default: 0,    null: false
    t.integer "user_id",              limit: 3,                             default: 0,    null: false
    t.string  "image_name",           limit: 255,                           default: "",   null: false
    t.text    "image_description",    limit: 65535,                                        null: false
    t.text    "image_keywords",       limit: 65535,                                        null: false
    t.integer "image_date",           limit: 4,                             default: 0,    null: false
    t.boolean "image_active",                                               default: true, null: false
    t.string  "image_media_file",     limit: 255,                           default: "",   null: false
    t.string  "image_thumb_file",     limit: 255,                           default: "",   null: false
    t.string  "image_download_url",   limit: 255,                           default: "",   null: false
    t.boolean "image_allow_comments",                                       default: true, null: false
    t.integer "image_comments",       limit: 2,                             default: 0,    null: false
    t.integer "image_downloads",      limit: 2,                             default: 0,    null: false
    t.integer "image_votes",          limit: 2,                             default: 0,    null: false
    t.decimal "image_rating",                       precision: 4, scale: 2, default: 0.0,  null: false
    t.integer "image_hits",           limit: 3,                             default: 0,    null: false
  end

  add_index "4images_images", ["cat_id"], name: "cat_id", using: :btree
  add_index "4images_images", ["image_active"], name: "image_active", using: :btree
  add_index "4images_images", ["image_date"], name: "image_date", using: :btree
  add_index "4images_images", ["user_id"], name: "user_id", using: :btree

  create_table "4images_images_temp", primary_key: "image_id", force: :cascade do |t|
    t.integer "cat_id",             limit: 3,     default: 0,  null: false
    t.integer "user_id",            limit: 3,     default: 0,  null: false
    t.string  "image_name",         limit: 255,   default: "", null: false
    t.text    "image_description",  limit: 65535,              null: false
    t.text    "image_keywords",     limit: 65535,              null: false
    t.integer "image_date",         limit: 4,     default: 0,  null: false
    t.string  "image_media_file",   limit: 255,   default: "", null: false
    t.string  "image_thumb_file",   limit: 255,   default: "", null: false
    t.string  "image_download_url", limit: 255,   default: "", null: false
  end

  add_index "4images_images_temp", ["cat_id"], name: "cat_id", using: :btree
  add_index "4images_images_temp", ["user_id"], name: "user_id", using: :btree

  create_table "4images_lightboxes", id: false, force: :cascade do |t|
    t.string  "lightbox_id",         limit: 32,    default: "", null: false
    t.integer "user_id",             limit: 3,     default: 0,  null: false
    t.integer "lightbox_lastaction", limit: 4,     default: 0,  null: false
    t.text    "lightbox_image_ids",  limit: 65535
  end

  add_index "4images_lightboxes", ["lightbox_id"], name: "lightbox_id", using: :btree
  add_index "4images_lightboxes", ["user_id"], name: "user_id", using: :btree

  create_table "4images_postcards", primary_key: "postcard_id", force: :cascade do |t|
    t.integer "image_id",                 limit: 3,     default: 0,  null: false
    t.integer "postcard_date",            limit: 4,     default: 0,  null: false
    t.string  "postcard_bg_color",        limit: 100,   default: "", null: false
    t.string  "postcard_border_color",    limit: 100,   default: "", null: false
    t.string  "postcard_font_color",      limit: 100,   default: "", null: false
    t.string  "postcard_font_face",       limit: 100,   default: "", null: false
    t.string  "postcard_sender_name",     limit: 255,   default: "", null: false
    t.string  "postcard_sender_email",    limit: 255,   default: "", null: false
    t.string  "postcard_recipient_name",  limit: 255,   default: "", null: false
    t.string  "postcard_recipient_email", limit: 255,   default: "", null: false
    t.string  "postcard_headline",        limit: 255,   default: "", null: false
    t.text    "postcard_message",         limit: 65535,              null: false
  end

  create_table "4images_sessions", primary_key: "session_id", force: :cascade do |t|
    t.integer "session_user_id",    limit: 3,   default: 0,  null: false
    t.integer "session_lastaction", limit: 4,   default: 0,  null: false
    t.string  "session_location",   limit: 255, default: "", null: false
    t.string  "session_ip",         limit: 15,  default: "", null: false
  end

  add_index "4images_sessions", ["session_id", "session_ip", "session_user_id"], name: "session_id_ip_user_id", using: :hash
  add_index "4images_sessions", ["session_user_id"], name: "session_user_id", using: :hash

  create_table "4images_sessionvars", id: false, force: :cascade do |t|
    t.string "session_id",        limit: 32,    default: "", null: false
    t.string "sessionvars_name",  limit: 30,    default: "", null: false
    t.text   "sessionvars_value", limit: 65535
  end

  add_index "4images_sessionvars", ["session_id"], name: "session_id", using: :btree

  create_table "4images_settings", primary_key: "setting_name", force: :cascade do |t|
    t.text "setting_value", limit: 16777215, null: false
  end

  create_table "4images_users", primary_key: "user_id", force: :cascade do |t|
    t.integer "user_level",         limit: 2,   default: 1,     null: false
    t.string  "user_name",          limit: 255, default: "",    null: false
    t.string  "user_password",      limit: 255, default: "",    null: false
    t.string  "user_email",         limit: 255, default: "",    null: false
    t.boolean "user_showemail",                 default: false, null: false
    t.boolean "user_allowemails",               default: true,  null: false
    t.boolean "user_invisible",                 default: false, null: false
    t.integer "user_joindate",      limit: 4,   default: 0,     null: false
    t.string  "user_activationkey", limit: 32,  default: "",    null: false
    t.integer "user_lastaction",    limit: 4,   default: 0,     null: false
    t.string  "user_location",      limit: 255, default: "",    null: false
    t.integer "user_lastvisit",     limit: 4,   default: 0,     null: false
    t.integer "user_comments",      limit: 2,   default: 0,     null: false
    t.string  "user_homepage",      limit: 255, default: "",    null: false
    t.string  "user_icq",           limit: 20,  default: "",    null: false
  end

  add_index "4images_users", ["user_lastaction"], name: "user_lastaction", using: :btree
  add_index "4images_users", ["user_name"], name: "user_name", using: :btree

  create_table "4images_wordlist", primary_key: "word_id", force: :cascade do |t|
    t.string "word_text", limit: 50, default: "", null: false
  end

  add_index "4images_wordlist", ["word_text"], name: "word_text", unique: true, using: :btree

  create_table "4images_wordmatch", id: false, force: :cascade do |t|
    t.integer "image_id",   limit: 3, default: 0,     null: false
    t.integer "word_id",    limit: 3, default: 0,     null: false
    t.boolean "name_match",           default: false, null: false
    t.boolean "desc_match",           default: false, null: false
    t.boolean "keys_match",           default: false, null: false
  end

  add_index "4images_wordmatch", ["image_id", "word_id"], name: "image_word_id", unique: true, using: :btree

  create_table "access", id: false, force: :cascade do |t|
    t.integer "userid",         limit: 4, default: 0, null: false
    t.integer "forumid",        limit: 2, default: 0, null: false
    t.integer "accessmask",     limit: 2, default: 0, null: false
    t.integer "importaccessid", limit: 4, default: 0, null: false
  end

  add_index "access", ["userid", "forumid"], name: "userid", using: :btree

  create_table "adminlog", primary_key: "adminlogid", force: :cascade do |t|
    t.integer "userid",    limit: 4,   default: 0,  null: false
    t.integer "dateline",  limit: 4,   default: 0,  null: false
    t.string  "script",    limit: 20,  default: "", null: false
    t.string  "action",    limit: 20,  default: "", null: false
    t.string  "extrainfo", limit: 200, default: "", null: false
    t.string  "ipaddress", limit: 15,  default: "", null: false
  end

  create_table "adminutil", id: false, force: :cascade do |t|
    t.string "title", limit: 10,       default: "", null: false
    t.text   "text",  limit: 16777215,              null: false
  end

  add_index "adminutil", ["title"], name: "title", using: :btree

  create_table "announcement", primary_key: "announcementid", force: :cascade do |t|
    t.string  "title",     limit: 250,      default: "", null: false
    t.integer "userid",    limit: 4,        default: 0,  null: false
    t.integer "startdate", limit: 4,        default: 0,  null: false
    t.integer "enddate",   limit: 4,        default: 0,  null: false
    t.text    "pagetext",  limit: 16777215,              null: false
    t.integer "forumid",   limit: 2,        default: 0,  null: false
  end

  add_index "announcement", ["forumid"], name: "forumid", using: :btree

  create_table "attachment", primary_key: "attachmentid", force: :cascade do |t|
    t.integer "userid",   limit: 4,        default: 0,  null: false
    t.integer "dateline", limit: 4,        default: 0,  null: false
    t.string  "filename", limit: 100,      default: "", null: false
    t.text    "filedata", limit: 16777215,              null: false
    t.integer "visible",  limit: 2,        default: 0,  null: false
    t.integer "counter",  limit: 2,        default: 0,  null: false
  end

  create_table "avatar", primary_key: "avatarid", force: :cascade do |t|
    t.string  "title",        limit: 100, default: "", null: false
    t.integer "minimumposts", limit: 2,   default: 0,  null: false
    t.string  "avatarpath",   limit: 100, default: "", null: false
  end

  create_table "bbcode", primary_key: "bbcodeid", force: :cascade do |t|
    t.string  "bbcodetag",         limit: 200,      default: "", null: false
    t.string  "bbcodereplacement", limit: 200,      default: "", null: false
    t.string  "bbcodeexample",     limit: 200,      default: "", null: false
    t.text    "bbcodeexplanation", limit: 16777215,              null: false
    t.integer "twoparams",         limit: 2,        default: 0,  null: false
  end

  create_table "calendar_events", primary_key: "eventid", force: :cascade do |t|
    t.integer "userid",       limit: 4,        default: 0,  null: false
    t.text    "event",        limit: 16777215,              null: false
    t.date    "eventdate",                                  null: false
    t.integer "public",       limit: 2,        default: 0,  null: false
    t.string  "subject",      limit: 254,      default: "", null: false
    t.integer "allowsmilies", limit: 2,        default: 1,  null: false
  end

  add_index "calendar_events", ["userid"], name: "userid", using: :btree

  create_table "customavatar", primary_key: "userid", force: :cascade do |t|
    t.text    "avatardata", limit: 16777215,              null: false
    t.integer "dateline",   limit: 4,        default: 0,  null: false
    t.string  "filename",   limit: 100,      default: "", null: false
  end

  create_table "forum", primary_key: "forumid", force: :cascade do |t|
    t.integer "styleid",           limit: 2,   default: 0,  null: false
    t.string  "title",             limit: 100, default: "", null: false
    t.string  "description",       limit: 250, default: "", null: false
    t.integer "active",            limit: 2,   default: 0,  null: false
    t.integer "displayorder",      limit: 2,   default: 0,  null: false
    t.integer "replycount",        limit: 4,   default: 0,  null: false
    t.integer "lastpost",          limit: 4,   default: 0,  null: false
    t.string  "lastposter",        limit: 50,  default: "", null: false
    t.integer "threadcount",       limit: 3,   default: 0,  null: false
    t.integer "allowposting",      limit: 1,   default: 0,  null: false
    t.integer "cancontainthreads", limit: 2,   default: 0,  null: false
    t.integer "daysprune",         limit: 2,   default: 0,  null: false
    t.string  "newpostemail",      limit: 250, default: "", null: false
    t.string  "newthreademail",    limit: 250, default: "", null: false
    t.integer "moderatenew",       limit: 2,   default: 0,  null: false
    t.integer "moderateattach",    limit: 2,   default: 0,  null: false
    t.integer "allowbbcode",       limit: 2,   default: 0,  null: false
    t.integer "allowimages",       limit: 2,   default: 0,  null: false
    t.integer "allowhtml",         limit: 2,   default: 0,  null: false
    t.integer "allowsmilies",      limit: 2,   default: 0,  null: false
    t.integer "allowicons",        limit: 2,   default: 0,  null: false
    t.integer "parentid",          limit: 2,   default: 0,  null: false
    t.string  "parentlist",        limit: 250, default: "", null: false
    t.integer "allowratings",      limit: 2,   default: 0,  null: false
    t.integer "countposts",        limit: 2,   default: 1,  null: false
    t.integer "styleoverride",     limit: 2,   default: 0,  null: false
    t.string  "password",          limit: 50,  default: "", null: false
    t.integer "importcategoryid",  limit: 2,   default: 0,  null: false
    t.integer "importforumid",     limit: 2,   default: 0,  null: false
    t.integer "isprivate",         limit: 4,   default: 0,  null: false
  end

  create_table "forumpermission", primary_key: "forumpermissionid", force: :cascade do |t|
    t.integer "forumid",                 limit: 2, default: 0, null: false
    t.integer "usergroupid",             limit: 2, default: 0, null: false
    t.integer "canview",                 limit: 2, default: 0, null: false
    t.integer "cansearch",               limit: 2, default: 0, null: false
    t.integer "canemail",                limit: 2, default: 0, null: false
    t.integer "canpostnew",              limit: 2, default: 0, null: false
    t.integer "canmove",                 limit: 2, default: 0, null: false
    t.integer "canopenclose",            limit: 2, default: 0, null: false
    t.integer "candeletethread",         limit: 2, default: 0, null: false
    t.integer "canreplyown",             limit: 2, default: 0, null: false
    t.integer "canreplyothers",          limit: 2, default: 0, null: false
    t.integer "canviewothers",           limit: 2, default: 0, null: false
    t.integer "caneditpost",             limit: 2, default: 0, null: false
    t.integer "candeletepost",           limit: 2, default: 0, null: false
    t.integer "canpostattachment",       limit: 2, default: 0, null: false
    t.integer "canpostpoll",             limit: 2, default: 0, null: false
    t.integer "canvote",                 limit: 2, default: 0, null: false
    t.integer "cangetattachment",        limit: 2, default: 1, null: false
    t.integer "importforumpermissionid", limit: 4, default: 0, null: false
  end

  add_index "forumpermission", ["usergroupid", "forumid"], name: "ugid_fid", using: :btree

  create_table "icon", primary_key: "iconid", force: :cascade do |t|
    t.string "title",    limit: 100, default: "", null: false
    t.string "iconpath", limit: 100, default: "", null: false
  end

  create_table "importtable", primary_key: "importid", force: :cascade do |t|
    t.integer "forumid",  limit: 2,   default: 0,  null: false
    t.string  "filename", limit: 255, default: "", null: false
  end

  add_index "importtable", ["forumid"], name: "forumid", using: :btree

  create_table "moderator", primary_key: "moderatorid", force: :cascade do |t|
    t.integer "userid",                 limit: 4, default: 0, null: false
    t.integer "forumid",                limit: 2, default: 0, null: false
    t.integer "newthreademail",         limit: 2, default: 0, null: false
    t.integer "newpostemail",           limit: 2, default: 0, null: false
    t.integer "caneditposts",           limit: 2, default: 0, null: false
    t.integer "candeleteposts",         limit: 2, default: 0, null: false
    t.integer "canviewips",             limit: 2, default: 0, null: false
    t.integer "canmanagethreads",       limit: 2, default: 0, null: false
    t.integer "canopenclose",           limit: 2, default: 0, null: false
    t.integer "caneditthreads",         limit: 2, default: 0, null: false
    t.integer "caneditstyles",          limit: 2, default: 0, null: false
    t.integer "canbanusers",            limit: 2, default: 0, null: false
    t.integer "canviewprofile",         limit: 2, default: 0, null: false
    t.integer "canannounce",            limit: 2, default: 0, null: false
    t.integer "canmassmove",            limit: 2, default: 0, null: false
    t.integer "canmassprune",           limit: 2, default: 0, null: false
    t.integer "canmoderateposts",       limit: 2, default: 0, null: false
    t.integer "canmoderateattachments", limit: 2, default: 0, null: false
    t.integer "importmoderatorid",      limit: 4, default: 0, null: false
  end

  add_index "moderator", ["userid", "forumid"], name: "userid", using: :btree

  create_table "poll", primary_key: "pollid", force: :cascade do |t|
    t.string  "question",      limit: 100,   default: "", null: false
    t.integer "dateline",      limit: 4,     default: 0,  null: false
    t.text    "options",       limit: 65535,              null: false
    t.text    "votes",         limit: 65535,              null: false
    t.integer "active",        limit: 2,     default: 1,  null: false
    t.integer "numberoptions", limit: 2,     default: 0,  null: false
    t.integer "timeout",       limit: 2,     default: 0,  null: false
    t.integer "multiple",      limit: 2,     default: 0,  null: false
    t.integer "voters",        limit: 2,     default: 0,  null: false
    t.string  "importpollid",  limit: 20,    default: "", null: false
  end

  create_table "pollvote", primary_key: "pollvoteid", force: :cascade do |t|
    t.integer "pollid",     limit: 4, default: 0, null: false
    t.integer "userid",     limit: 4, default: 0, null: false
    t.integer "votedate",   limit: 4, default: 0, null: false
    t.integer "voteoption", limit: 4, default: 0, null: false
  end

  add_index "pollvote", ["userid", "pollid"], name: "userid", using: :btree

  create_table "post", primary_key: "postid", force: :cascade do |t|
    t.integer "threadid",      limit: 4,        default: 0,  null: false
    t.string  "username",      limit: 50,       default: "", null: false
    t.integer "userid",        limit: 4,        default: 0,  null: false
    t.string  "title",         limit: 100,      default: "", null: false
    t.integer "dateline",      limit: 4,        default: 0,  null: false
    t.integer "attachmentid",  limit: 2,        default: 0,  null: false
    t.text    "pagetext",      limit: 16777215,              null: false
    t.integer "allowsmilie",   limit: 2,        default: 0,  null: false
    t.integer "showsignature", limit: 2,        default: 0,  null: false
    t.string  "ipaddress",     limit: 16,       default: "", null: false
    t.integer "iconid",        limit: 2,        default: 0,  null: false
    t.integer "visible",       limit: 2,        default: 0,  null: false
    t.integer "edituserid",    limit: 4,        default: 0,  null: false
    t.integer "editdate",      limit: 4,        default: 0,  null: false
    t.integer "importpostid",  limit: 4,        default: 0,  null: false
  end

  add_index "post", ["iconid"], name: "iconid", using: :btree
  add_index "post", ["threadid", "userid"], name: "threadid", using: :btree
  add_index "post", ["userid"], name: "userid", using: :btree

  create_table "privatemessage", primary_key: "privatemessageid", force: :cascade do |t|
    t.integer "folderid",           limit: 2,        default: 0,  null: false
    t.integer "userid",             limit: 4,        default: 0,  null: false
    t.integer "touserid",           limit: 4,        default: 0,  null: false
    t.integer "fromuserid",         limit: 4,        default: 0,  null: false
    t.string  "title",              limit: 250,      default: "", null: false
    t.text    "message",            limit: 16777215,              null: false
    t.integer "dateline",           limit: 4,        default: 0,  null: false
    t.integer "showsignature",      limit: 2,        default: 0,  null: false
    t.integer "iconid",             limit: 2,        default: 0,  null: false
    t.integer "messageread",        limit: 2,        default: 0,  null: false
    t.integer "readtime",           limit: 4,        default: 0,  null: false
    t.integer "receipt",            limit: 2,        default: 0,  null: false
    t.integer "deleteprompt",       limit: 2,        default: 0,  null: false
    t.integer "multiplerecipients", limit: 2,        default: 0,  null: false
    t.integer "importpmid",         limit: 4,        default: 0,  null: false
  end

  add_index "privatemessage", ["userid"], name: "userid", using: :btree

  create_table "profilefield", primary_key: "profilefieldid", force: :cascade do |t|
    t.string  "title",        limit: 50,  default: "",  null: false
    t.string  "description",  limit: 250, default: "",  null: false
    t.integer "required",     limit: 2,   default: 0,   null: false
    t.integer "hidden",       limit: 2,   default: 0,   null: false
    t.integer "maxlength",    limit: 2,   default: 250, null: false
    t.integer "size",         limit: 2,   default: 25,  null: false
    t.integer "displayorder", limit: 2,   default: 0,   null: false
    t.integer "editable",     limit: 2,   default: 1,   null: false
  end

  create_table "replacement", primary_key: "replacementid", force: :cascade do |t|
    t.integer "replacementsetid", limit: 2,     default: 0, null: false
    t.text    "findword",         limit: 65535,             null: false
    t.text    "replaceword",      limit: 65535,             null: false
  end

  add_index "replacement", ["replacementsetid"], name: "replacementsetid", using: :btree

  create_table "replacementset", primary_key: "replacementsetid", force: :cascade do |t|
    t.string  "title",                  limit: 250, default: "", null: false
    t.integer "importreplacementsetid", limit: 2,   default: 0,  null: false
  end

  create_table "search", primary_key: "searchid", force: :cascade do |t|
    t.text    "query",       limit: 16777215,              null: false
    t.text    "postids",     limit: 16777215,              null: false
    t.integer "dateline",    limit: 4,        default: 0,  null: false
    t.string  "querystring", limit: 200,      default: "", null: false
    t.integer "showposts",   limit: 2,        default: 0,  null: false
    t.integer "userid",      limit: 4,        default: 0,  null: false
    t.string  "ipaddress",   limit: 20,       default: "", null: false
  end

  add_index "search", ["querystring"], name: "querystring", using: :btree
  add_index "search", ["userid"], name: "userid", using: :btree

  create_table "searchindex", id: false, force: :cascade do |t|
    t.integer "wordid",  limit: 4, default: 0, null: false
    t.integer "postid",  limit: 4, default: 0, null: false
    t.integer "intitle", limit: 2, default: 0, null: false
  end

  add_index "searchindex", ["wordid", "postid"], name: "wordid", using: :btree

  create_table "session", primary_key: "sessionhash", force: :cascade do |t|
    t.integer "userid",       limit: 4,   default: 0,  null: false
    t.string  "host",         limit: 50,  default: "", null: false
    t.string  "useragent",    limit: 50,  default: "", null: false
    t.integer "lastactivity", limit: 4,   default: 0,  null: false
    t.string  "location",     limit: 255, default: "", null: false
    t.integer "styleid",      limit: 2,   default: 0,  null: false
  end

  create_table "setting", primary_key: "settingid", force: :cascade do |t|
    t.integer "settinggroupid", limit: 2,        default: 0,  null: false
    t.string  "title",          limit: 100,      default: "", null: false
    t.string  "varname",        limit: 100,      default: "", null: false
    t.text    "value",          limit: 16777215,              null: false
    t.text    "description",    limit: 16777215,              null: false
    t.text    "optioncode",     limit: 16777215,              null: false
    t.integer "displayorder",   limit: 2,        default: 0,  null: false
  end

  create_table "settinggroup", primary_key: "settinggroupid", force: :cascade do |t|
    t.string  "title",        limit: 100, default: "", null: false
    t.integer "displayorder", limit: 2,   default: 0,  null: false
  end

  create_table "smilie", primary_key: "smilieid", force: :cascade do |t|
    t.string "title",      limit: 100, default: "", null: false
    t.string "smilietext", limit: 10,  default: "", null: false
    t.string "smiliepath", limit: 100, default: "", null: false
  end

  create_table "style", primary_key: "styleid", force: :cascade do |t|
    t.integer "replacementsetid", limit: 2,   default: 0,  null: false
    t.integer "templatesetid",    limit: 2,   default: 0,  null: false
    t.string  "title",            limit: 250, default: "", null: false
    t.integer "userselect",       limit: 2,   default: 0,  null: false
    t.integer "importstyleid",    limit: 2,   default: 0,  null: false
  end

  create_table "subscribeforum", primary_key: "subscribeforumid", force: :cascade do |t|
    t.integer "userid",                 limit: 4, default: 0, null: false
    t.integer "forumid",                limit: 2, default: 0, null: false
    t.integer "emailupdate",            limit: 2, default: 0, null: false
    t.integer "importsubscribeforumid", limit: 4, default: 0, null: false
  end

  add_index "subscribeforum", ["userid"], name: "userid", using: :btree

  create_table "subscribethread", primary_key: "subscribethreadid", force: :cascade do |t|
    t.integer "userid",                  limit: 4, default: 0, null: false
    t.integer "threadid",                limit: 4, default: 0, null: false
    t.integer "emailupdate",             limit: 2, default: 0, null: false
    t.integer "importsubscribethreadid", limit: 4, default: 0, null: false
  end

  add_index "subscribethread", ["threadid"], name: "threadid", using: :btree

  create_table "template", primary_key: "templateid", force: :cascade do |t|
    t.integer "templatesetid", limit: 2,        default: 0,  null: false
    t.string  "title",         limit: 100,      default: "", null: false
    t.text    "template",      limit: 16777215,              null: false
  end

  add_index "template", ["title", "templatesetid"], name: "title", using: :btree

  create_table "templateset", primary_key: "templatesetid", force: :cascade do |t|
    t.string  "title",               limit: 250, default: "", null: false
    t.integer "importtemplatesetid", limit: 2,   default: 0,  null: false
  end

  create_table "thread", primary_key: "threadid", force: :cascade do |t|
    t.string  "title",          limit: 100, default: "", null: false
    t.integer "lastpost",       limit: 4,   default: 0,  null: false
    t.integer "forumid",        limit: 2,   default: 0,  null: false
    t.integer "pollid",         limit: 4,   default: 0,  null: false
    t.integer "open",           limit: 1,   default: 0,  null: false
    t.integer "replycount",     limit: 4,   default: 0,  null: false
    t.string  "postusername",   limit: 50,  default: "", null: false
    t.integer "postuserid",     limit: 4,   default: 0,  null: false
    t.string  "lastposter",     limit: 50,  default: "", null: false
    t.integer "dateline",       limit: 4,   default: 0,  null: false
    t.integer "views",          limit: 4,   default: 0,  null: false
    t.integer "iconid",         limit: 2,   default: 0,  null: false
    t.string  "notes",          limit: 250, default: "", null: false
    t.integer "visible",        limit: 2,   default: 0,  null: false
    t.integer "sticky",         limit: 2,   default: 0,  null: false
    t.integer "votenum",        limit: 2,   default: 0,  null: false
    t.integer "votetotal",      limit: 2,   default: 0,  null: false
    t.integer "attach",         limit: 2,   default: 0,  null: false
    t.integer "importthreadid", limit: 4,   default: 0,  null: false
  end

  add_index "thread", ["forumid", "visible", "sticky", "lastpost"], name: "forumid", using: :btree
  add_index "thread", ["iconid"], name: "iconid", using: :btree

  create_table "threadrate", primary_key: "threadrateid", force: :cascade do |t|
    t.integer "threadid",  limit: 4,  default: 0,  null: false
    t.integer "userid",    limit: 4,  default: 0,  null: false
    t.integer "vote",      limit: 2,  default: 0,  null: false
    t.string  "ipaddress", limit: 20, default: "", null: false
  end

  add_index "threadrate", ["threadid"], name: "threadid", using: :btree

  create_table "user", primary_key: "userid", force: :cascade do |t|
    t.integer "usergroupid",       limit: 2,        default: 0,  null: false
    t.string  "username",          limit: 50,       default: "", null: false
    t.string  "password",          limit: 50,       default: "", null: false
    t.string  "email",             limit: 50,       default: "", null: false
    t.integer "styleid",           limit: 2,        default: 0,  null: false
    t.string  "parentemail",       limit: 50,       default: "", null: false
    t.integer "coppauser",         limit: 2,        default: 0,  null: false
    t.string  "homepage",          limit: 100,      default: "", null: false
    t.string  "icq",               limit: 20,       default: "", null: false
    t.string  "aim",               limit: 20,       default: "", null: false
    t.string  "yahoo",             limit: 20,       default: "", null: false
    t.text    "signature",         limit: 16777215,              null: false
    t.integer "adminemail",        limit: 2,        default: 0,  null: false
    t.integer "showemail",         limit: 2,        default: 0,  null: false
    t.integer "invisible",         limit: 2,        default: 0,  null: false
    t.string  "usertitle",         limit: 250,      default: "", null: false
    t.integer "customtitle",       limit: 2,        default: 0,  null: false
    t.integer "joindate",          limit: 4,        default: 0,  null: false
    t.integer "cookieuser",        limit: 2,        default: 0,  null: false
    t.integer "daysprune",         limit: 2,        default: 0,  null: false
    t.integer "lastvisit",         limit: 4,        default: 0,  null: false
    t.integer "lastactivity",      limit: 4,        default: 0,  null: false
    t.integer "lastpost",          limit: 4,        default: 0,  null: false
    t.integer "posts",             limit: 2,        default: 0,  null: false
    t.string  "timezoneoffset",    limit: 4,        default: "", null: false
    t.integer "emailnotification", limit: 2,        default: 0,  null: false
    t.text    "buddylist",         limit: 16777215,              null: false
    t.text    "ignorelist",        limit: 16777215,              null: false
    t.text    "pmfolders",         limit: 16777215,              null: false
    t.integer "receivepm",         limit: 2,        default: 0,  null: false
    t.integer "emailonpm",         limit: 2,        default: 0,  null: false
    t.integer "pmpopup",           limit: 2,        default: 0,  null: false
    t.integer "avatarid",          limit: 2,        default: 0,  null: false
    t.integer "options",           limit: 2,        default: 15, null: false
    t.date    "birthday",                                        null: false
    t.integer "maxposts",          limit: 2,        default: -1, null: false
    t.integer "startofweek",       limit: 2,        default: 1,  null: false
    t.string  "ipaddress",         limit: 20,       default: "", null: false
    t.integer "referrerid",        limit: 4,        default: 0,  null: false
    t.integer "nosessionhash",     limit: 2,        default: 0,  null: false
    t.integer "inforum",           limit: 2,        default: 0,  null: false
    t.integer "importuserid",      limit: 8,        default: 0,  null: false
    t.integer "isnew",             limit: 4,        default: 0,  null: false
  end

  add_index "user", ["importuserid", "isnew"], name: "userimport", using: :btree
  add_index "user", ["inforum"], name: "inforum", using: :btree
  add_index "user", ["usergroupid"], name: "usergroupid", using: :btree
  add_index "user", ["username"], name: "username", using: :btree

  create_table "useractivation", primary_key: "useractivationid", force: :cascade do |t|
    t.integer "userid",       limit: 4,  default: 0,  null: false
    t.integer "dateline",     limit: 4,  default: 0,  null: false
    t.string  "activationid", limit: 20, default: "", null: false
    t.integer "type",         limit: 2,  default: 0,  null: false
  end

  add_index "useractivation", ["userid", "type"], name: "userid", using: :btree

  create_table "userfield", primary_key: "userid", force: :cascade do |t|
    t.string  "field1",       limit: 250, default: "", null: false
    t.string  "field2",       limit: 250, default: "", null: false
    t.string  "field3",       limit: 250, default: "", null: false
    t.string  "field4",       limit: 250, default: "", null: false
    t.string  "userspezial6", limit: 20,  default: "", null: false
    t.string  "userspezial7", limit: 20,  default: "", null: false
    t.integer "importuserid", limit: 4,   default: 0,  null: false
    t.integer "isnew",        limit: 4,   default: 0,  null: false
  end

  create_table "usergroup", primary_key: "usergroupid", force: :cascade do |t|
    t.string  "title",             limit: 100, default: "", null: false
    t.string  "usertitle",         limit: 100, default: "", null: false
    t.integer "cancontrolpanel",   limit: 2,   default: 0,  null: false
    t.integer "canmodifyprofile",  limit: 2,   default: 0,  null: false
    t.integer "canviewmembers",    limit: 2,   default: 0,  null: false
    t.integer "canview",           limit: 2,   default: 0,  null: false
    t.integer "cansearch",         limit: 2,   default: 0,  null: false
    t.integer "canemail",          limit: 2,   default: 0,  null: false
    t.integer "canpostnew",        limit: 2,   default: 0,  null: false
    t.integer "canmove",           limit: 2,   default: 0,  null: false
    t.integer "canopenclose",      limit: 2,   default: 0,  null: false
    t.integer "candeletethread",   limit: 2,   default: 0,  null: false
    t.integer "canreplyown",       limit: 2,   default: 0,  null: false
    t.integer "canreplyothers",    limit: 2,   default: 0,  null: false
    t.integer "canviewothers",     limit: 2,   default: 0,  null: false
    t.integer "caneditpost",       limit: 2,   default: 0,  null: false
    t.integer "candeletepost",     limit: 2,   default: 0,  null: false
    t.integer "canusepm",          limit: 2,   default: 0,  null: false
    t.integer "canpostpoll",       limit: 2,   default: 0,  null: false
    t.integer "canvote",           limit: 2,   default: 0,  null: false
    t.integer "canpostattachment", limit: 2,   default: 0,  null: false
    t.integer "canpublicevent",    limit: 2,   default: 0,  null: false
    t.integer "canpublicedit",     limit: 2,   default: 0,  null: false
    t.integer "canthreadrate",     limit: 2,   default: 1,  null: false
    t.integer "maxbuddypm",        limit: 2,   default: 5,  null: false
    t.integer "maxforwardpm",      limit: 2,   default: 5,  null: false
    t.integer "cantrackpm",        limit: 2,   default: 1,  null: false
    t.integer "candenypmreceipts", limit: 2,   default: 1,  null: false
    t.integer "canwhosonline",     limit: 2,   default: 1,  null: false
    t.integer "canwhosonlineip",   limit: 2,   default: 0,  null: false
    t.integer "ismoderator",       limit: 2,   default: 0,  null: false
    t.integer "showgroup",         limit: 2,   default: 0,  null: false
    t.integer "cangetattachment",  limit: 2,   default: 1,  null: false
    t.integer "importusergroupid", limit: 4,   default: 0,  null: false
  end

  add_index "usergroup", ["showgroup"], name: "showgroup", using: :btree

  create_table "usertitle", primary_key: "usertitleid", force: :cascade do |t|
    t.integer "minposts", limit: 2,   default: 0,  null: false
    t.string  "title",    limit: 250, default: "", null: false
  end

  create_table "word", primary_key: "wordid", force: :cascade do |t|
    t.string "title", limit: 50, default: "", null: false
  end

  add_index "word", ["title"], name: "title", using: :btree

  create_table "zen_albums", force: :cascade do |t|
    t.integer  "parentid",            limit: 4
    t.string   "folder",              limit: 255,   default: "", null: false
    t.string   "title",               limit: 255,   default: "", null: false
    t.text     "desc",                limit: 65535
    t.datetime "date"
    t.string   "place",               limit: 255
    t.integer  "show",                limit: 4,     default: 1,  null: false
    t.integer  "closecomments",       limit: 4,     default: 0,  null: false
    t.string   "thumb",               limit: 255
    t.integer  "mtime",               limit: 4
    t.string   "sort_type",           limit: 20
    t.string   "subalbum_sort_type",  limit: 20
    t.integer  "sort_order",          limit: 4
    t.integer  "image_sortdirection", limit: 4,     default: 0
    t.integer  "album_sortdirection", limit: 4,     default: 0
    t.text     "tags",                limit: 65535
  end

  add_index "zen_albums", ["folder"], name: "folder", using: :btree

  create_table "zen_comments", force: :cascade do |t|
    t.integer  "imageid",      limit: 4,     default: 0,  null: false
    t.string   "name",         limit: 255,   default: "", null: false
    t.string   "email",        limit: 255,   default: "", null: false
    t.string   "website",      limit: 255
    t.datetime "date"
    t.text     "comment",      limit: 65535,              null: false
    t.integer  "inmoderation", limit: 4,     default: 0,  null: false
  end

  add_index "zen_comments", ["imageid"], name: "imageid", using: :btree

  create_table "zen_images", force: :cascade do |t|
    t.integer  "albumid",               limit: 4,     default: 0,  null: false
    t.string   "filename",              limit: 255,   default: "", null: false
    t.string   "title",                 limit: 255
    t.text     "desc",                  limit: 65535
    t.text     "location",              limit: 255
    t.text     "city",                  limit: 255
    t.text     "state",                 limit: 255
    t.text     "country",               limit: 255
    t.text     "tags",                  limit: 65535
    t.integer  "commentson",            limit: 4,     default: 1,  null: false
    t.integer  "show",                  limit: 4,     default: 1,  null: false
    t.datetime "date"
    t.integer  "sort_order",            limit: 4
    t.integer  "height",                limit: 4
    t.integer  "width",                 limit: 4
    t.integer  "mtime",                 limit: 4
    t.integer  "EXIFValid",             limit: 4
    t.integer  "hitcounter",            limit: 4
    t.string   "EXIFOrientation",       limit: 52
    t.string   "EXIFMake",              limit: 52
    t.string   "EXIFModel",             limit: 52
    t.string   "EXIFExposureTime",      limit: 52
    t.string   "EXIFFNumber",           limit: 52
    t.string   "EXIFFocalLength",       limit: 52
    t.string   "EXIFFocalLength35mm",   limit: 52
    t.string   "EXIFISOSpeedRatings",   limit: 52
    t.string   "EXIFDateTimeOriginal",  limit: 52
    t.string   "EXIFExposureBiasValue", limit: 52
    t.string   "EXIFMeteringMode",      limit: 52
    t.string   "EXIFFlash",             limit: 52
    t.string   "EXIFImageWidth",        limit: 52
    t.string   "EXIFImageHeight",       limit: 52
    t.string   "EXIFContrast",          limit: 52
    t.string   "EXIFSharpness",         limit: 52
    t.string   "EXIFSaturation",        limit: 52
    t.string   "EXIFGPSLatitude",       limit: 52
    t.string   "EXIFGPSLatitudeRef",    limit: 52
    t.string   "EXIFGPSLongitude",      limit: 52
    t.string   "EXIFGPSLongitudeRef",   limit: 52
    t.string   "EXIFGPSAltitude",       limit: 52
    t.string   "EXIFGPSAltitudeRef",    limit: 52
  end

  add_index "zen_images", ["albumid"], name: "zen_images_ibfk1", using: :btree
  add_index "zen_images", ["filename", "albumid"], name: "filename", using: :btree

  create_table "zen_options", force: :cascade do |t|
    t.string "name",  limit: 64,    default: "", null: false
    t.text   "value", limit: 65535
  end

  add_index "zen_options", ["name"], name: "name", unique: true, using: :btree

end

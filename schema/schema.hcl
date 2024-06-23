table "auth_group" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "name" {
    null = false
    type = character_varying(150)
  }
  primary_key {
    columns = [column.id]
  }
  index "auth_group_name_a6ea08ec_like" {
    on {
      column = column.name
      ops    = varchar_pattern_ops
    }
  }
  unique "auth_group_name_key" {
    columns = [column.name]
  }
}
table "auth_group_permissions" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "group_id" {
    null = false
    type = integer
  }
  column "permission_id" {
    null = false
    type = integer
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" {
    columns     = [column.permission_id]
    ref_columns = [table.auth_permission.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" {
    columns     = [column.group_id]
    ref_columns = [table.auth_group.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "auth_group_permissions_group_id_b120cbf9" {
    columns = [column.group_id]
  }
  index "auth_group_permissions_permission_id_84c5c92e" {
    columns = [column.permission_id]
  }
  unique "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" {
    columns = [column.group_id, column.permission_id]
  }
}
table "auth_permission" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "name" {
    null = false
    type = character_varying(255)
  }
  column "content_type_id" {
    null = false
    type = integer
  }
  column "codename" {
    null = false
    type = character_varying(100)
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "auth_permission_content_type_id_2f476e4b_fk_django_co" {
    columns     = [column.content_type_id]
    ref_columns = [table.django_content_type.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "auth_permission_content_type_id_2f476e4b" {
    columns = [column.content_type_id]
  }
  unique "auth_permission_content_type_id_codename_01ab375a_uniq" {
    columns = [column.content_type_id, column.codename]
  }
}
table "auth_user" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "password" {
    null = false
    type = character_varying(128)
  }
  column "last_login" {
    null = true
    type = timestamptz
  }
  column "is_superuser" {
    null = false
    type = boolean
  }
  column "username" {
    null = false
    type = character_varying(150)
  }
  column "first_name" {
    null = false
    type = character_varying(150)
  }
  column "last_name" {
    null = false
    type = character_varying(150)
  }
  column "email" {
    null = false
    type = character_varying(254)
  }
  column "is_staff" {
    null = false
    type = boolean
  }
  column "is_active" {
    null = false
    type = boolean
  }
  column "date_joined" {
    null = false
    type = timestamptz
  }
  primary_key {
    columns = [column.id]
  }
  index "auth_user_username_6821ab7c_like" {
    on {
      column = column.username
      ops    = varchar_pattern_ops
    }
  }
  unique "auth_user_username_key" {
    columns = [column.username]
  }
}
table "auth_user_groups" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "user_id" {
    null = false
    type = integer
  }
  column "group_id" {
    null = false
    type = integer
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "auth_user_groups_group_id_97559544_fk_auth_group_id" {
    columns     = [column.group_id]
    ref_columns = [table.auth_group.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" {
    columns     = [column.user_id]
    ref_columns = [table.auth_user.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "auth_user_groups_group_id_97559544" {
    columns = [column.group_id]
  }
  index "auth_user_groups_user_id_6a12ed8b" {
    columns = [column.user_id]
  }
  unique "auth_user_groups_user_id_group_id_94350c0c_uniq" {
    columns = [column.user_id, column.group_id]
  }
}
table "auth_user_user_permissions" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "user_id" {
    null = false
    type = integer
  }
  column "permission_id" {
    null = false
    type = integer
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" {
    columns     = [column.permission_id]
    ref_columns = [table.auth_permission.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" {
    columns     = [column.user_id]
    ref_columns = [table.auth_user.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "auth_user_user_permissions_permission_id_1fbb5f2c" {
    columns = [column.permission_id]
  }
  index "auth_user_user_permissions_user_id_a95ead1b" {
    columns = [column.user_id]
  }
  unique "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" {
    columns = [column.user_id, column.permission_id]
  }
}
table "authtoken_token" {
  schema = schema.public
  column "key" {
    null = false
    type = character_varying(40)
  }
  column "created" {
    null = false
    type = timestamptz
  }
  column "user_id" {
    null = false
    type = integer
  }
  primary_key {
    columns = [column.key]
  }
  foreign_key "authtoken_token_user_id_35299eff_fk_auth_user_id" {
    columns     = [column.user_id]
    ref_columns = [table.auth_user.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "authtoken_token_key_10f0b77e_like" {
    on {
      column = column.key
      ops    = varchar_pattern_ops
    }
  }
  unique "authtoken_token_user_id_key" {
    columns = [column.user_id]
  }
}
table "django_admin_log" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "action_time" {
    null = false
    type = timestamptz
  }
  column "object_id" {
    null = true
    type = text
  }
  column "object_repr" {
    null = false
    type = character_varying(200)
  }
  column "action_flag" {
    null = false
    type = smallint
  }
  column "change_message" {
    null = false
    type = text
  }
  column "content_type_id" {
    null = true
    type = integer
  }
  column "user_id" {
    null = false
    type = integer
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "django_admin_log_content_type_id_c4bce8eb_fk_django_co" {
    columns     = [column.content_type_id]
    ref_columns = [table.django_content_type.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "django_admin_log_user_id_c564eba6_fk_auth_user_id" {
    columns     = [column.user_id]
    ref_columns = [table.auth_user.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "django_admin_log_content_type_id_c4bce8eb" {
    columns = [column.content_type_id]
  }
  index "django_admin_log_user_id_c564eba6" {
    columns = [column.user_id]
  }
  check "django_admin_log_action_flag_check" {
    expr = "(action_flag >= 0)"
  }
}
table "django_content_type" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "app_label" {
    null = false
    type = character_varying(100)
  }
  column "model" {
    null = false
    type = character_varying(100)
  }
  primary_key {
    columns = [column.id]
  }
  unique "django_content_type_app_label_model_76bd3d3b_uniq" {
    columns = [column.app_label, column.model]
  }
}
table "django_migrations" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "app" {
    null = false
    type = character_varying(255)
  }
  column "name" {
    null = false
    type = character_varying(255)
  }
  column "applied" {
    null = false
    type = timestamptz
  }
  primary_key {
    columns = [column.id]
  }
}
table "django_session" {
  schema = schema.public
  column "session_key" {
    null = false
    type = character_varying(40)
  }
  column "session_data" {
    null = false
    type = text
  }
  column "expire_date" {
    null = false
    type = timestamptz
  }
  primary_key {
    columns = [column.session_key]
  }
  index "django_session_expire_date_a5c62663" {
    columns = [column.expire_date]
  }
  index "django_session_session_key_c0390e0f_like" {
    on {
      column = column.session_key
      ops    = varchar_pattern_ops
    }
  }
}
table "patrik_mimic" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "name" {
    null = false
    type = character_varying(30)
  }
  column "favorite" {
    null = true
    type = boolean
  }
  primary_key {
    columns = [column.id]
  }
  index "patrik_mimic_name_5e5df097_like" {
    on {
      column = column.name
      ops    = varchar_pattern_ops
    }
  }
  unique "patrik_mimic_name_key" {
    columns = [column.name]
  }
}
table "patrik_mimicitem" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "style_left_eye" {
    null = false
    type = integer
  }
  column "h_right_eye" {
    null = true
    type = integer
  }
  column "w_left_eye" {
    null = true
    type = integer
  }
  column "h_mouth" {
    null = true
    type = integer
  }
  column "h_left_eye" {
    null = true
    type = integer
  }
  column "delay" {
    null = true
    type = double_precision
  }
  column "easing" {
    null = false
    type = text
  }
  column "order" {
    null = false
    type = integer
  }
  column "mimic_id" {
    null = true
    type = integer
  }
  column "style_mouth" {
    null = false
    type = integer
  }
  column "style_right_eye" {
    null = false
    type = integer
  }
  column "w_mouth" {
    null = true
    type = integer
  }
  column "w_right_eye" {
    null = true
    type = integer
  }
  column "x_left_eye" {
    null = true
    type = integer
  }
  column "x_mouth" {
    null = true
    type = integer
  }
  column "x_right_eye" {
    null = true
    type = integer
  }
  column "y_left_eye" {
    null = true
    type = integer
  }
  column "y_mouth" {
    null = true
    type = integer
  }
  column "y_right_eye" {
    null = true
    type = integer
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "patrik_mimicitem_mimic_id_5bf566d7_fk" {
    columns     = [column.mimic_id]
    ref_columns = [table.patrik_mimic.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "patrik_mimicitem_mimic_id_5bf566d7" {
    columns = [column.mimic_id]
  }
}
table "patrik_move" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "name" {
    null = false
    type = character_varying(30)
  }
  column "favorite" {
    null = true
    type = boolean
  }
  primary_key {
    columns = [column.id]
  }
  index "patrik_move_name_16022d79_like" {
    on {
      column = column.name
      ops    = varchar_pattern_ops
    }
  }
  unique "patrik_move_name_key" {
    columns = [column.name]
  }
}
table "patrik_moveexpression" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "move_id" {
    null = true
    type = integer
  }
  column "operation" {
    null = false
    type = integer
  }
  column "script_id" {
    null = false
    type = integer
  }
  column "delay" {
    null = true
    type = double_precision
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "patrik_moveexpression_move_id_2c4af1bf_fk" {
    columns     = [column.move_id]
    ref_columns = [table.patrik_move.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "patrik_moveexpression_script_id_3886a4a3_fk" {
    columns     = [column.script_id]
    ref_columns = [table.patrik_script.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "patrik_moveexpression_move_id_2c4af1bf" {
    columns = [column.move_id]
  }
  index "patrik_moveexpression_script_id_3886a4a3" {
    columns = [column.script_id]
  }
}
table "patrik_pose" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "l1" {
    null = false
    type = integer
  }
  column "l2" {
    null = false
    type = integer
  }
  column "l3" {
    null = false
    type = integer
  }
  column "l4" {
    null = false
    type = integer
  }
  column "l5" {
    null = false
    type = integer
  }
  column "neck" {
    null = false
    type = integer
  }
  column "head" {
    null = false
    type = integer
  }
  column "r1" {
    null = false
    type = integer
  }
  column "r2" {
    null = false
    type = integer
  }
  column "r3" {
    null = false
    type = integer
  }
  column "r4" {
    null = false
    type = integer
  }
  column "r5" {
    null = false
    type = integer
  }
  column "phrase" {
    null = false
    type = text
  }
  column "delay" {
    null = true
    type = double_precision
  }
  column "order" {
    null = false
    type = integer
  }
  column "mimic_id" {
    null = true
    type = integer
  }
  column "move_id" {
    null = false
    type = integer
  }
  column "name" {
    null = false
    type = character_varying(30)
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "patrik_pose_mimic_id_42f94dcb_fk" {
    columns     = [column.mimic_id]
    ref_columns = [table.patrik_mimic.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "patrik_pose_move_id_01c897bf_fk" {
    columns     = [column.move_id]
    ref_columns = [table.patrik_move.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "patrik_pose_mimic_id_42f94dcb" {
    columns = [column.mimic_id]
  }
  index "patrik_pose_move_id_01c897bf" {
    columns = [column.move_id]
  }
}
table "patrik_robotname" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "name" {
    null = false
    type = character_varying(30)
  }
  primary_key {
    columns = [column.id]
  }
}
table "patrik_script" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "name" {
    null = false
    type = character_varying(30)
  }
  column "active" {
    null = false
    type = boolean
  }
  primary_key {
    columns = [column.id]
  }
  index "patrik_script_name_2051a01a_like" {
    on {
      column = column.name
      ops    = varchar_pattern_ops
    }
  }
  unique "patrik_script_name_key" {
    columns = [column.name]
  }
}
table "patrik_script_triggers" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "script_id" {
    null = false
    type = integer
  }
  column "trigger_id" {
    null = false
    type = integer
  }
  primary_key {
    columns = [column.id]
  }
  index "patrik_script_triggers_script_id_a25e2949" {
    columns = [column.script_id]
  }
  index "patrik_script_triggers_trigger_id_443f3fbf" {
    columns = [column.trigger_id]
  }
  unique "patrik_script_triggers_script_id_trigger_id_e0f0ee54_uniq" {
    columns = [column.script_id, column.trigger_id]
  }
}
table "patrik_servoendstops" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "name" {
    null = false
    type = character_varying(30)
  }
  column "l1_max" {
    null = false
    type = integer
  }
  column "l1_min" {
    null = false
    type = integer
  }
  column "l2_max" {
    null = false
    type = integer
  }
  column "l2_min" {
    null = false
    type = integer
  }
  column "l3_max" {
    null = false
    type = integer
  }
  column "l3_min" {
    null = false
    type = integer
  }
  column "l4_max" {
    null = false
    type = integer
  }
  column "l4_min" {
    null = false
    type = integer
  }
  column "l5_max" {
    null = false
    type = integer
  }
  column "l5_min" {
    null = false
    type = integer
  }
  column "neck_max" {
    null = false
    type = integer
  }
  column "neck_min" {
    null = false
    type = integer
  }
  column "head_max" {
    null = false
    type = integer
  }
  column "head_min" {
    null = false
    type = integer
  }
  column "r1_max" {
    null = false
    type = integer
  }
  column "r1_min" {
    null = false
    type = integer
  }
  column "r2_max" {
    null = false
    type = integer
  }
  column "r2_min" {
    null = false
    type = integer
  }
  column "r3_max" {
    null = false
    type = integer
  }
  column "r3_min" {
    null = false
    type = integer
  }
  column "r4_max" {
    null = false
    type = integer
  }
  column "r4_min" {
    null = false
    type = integer
  }
  column "r5_max" {
    null = false
    type = integer
  }
  column "r5_min" {
    null = false
    type = integer
  }
  primary_key {
    columns = [column.id]
  }
}
table "patrik_trigger" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "name" {
    null = true
    type = character_varying(30)
  }
  column "trigger_type" {
    null = false
    type = integer
  }
  column "busy" {
    null = true
    type = boolean
  }
  column "phrase" {
    null = true
    type = text
  }
  column "face_encoding" {
    null = true
    type = text
  }
  column "gesture_landmarks" {
    null = true
    type = text
  }
  column "time" {
    null = true
    type = time
  }
  column "period" {
    null = true
    type = integer
  }
  column "number" {
    null = false
    type = integer
  }
  column "startup" {
    null = false
    type = boolean
  }
  column "week" {
    null = true
    type = integer
  }
  column "face_rule" {
    null = false
    type = character_varying(9)
  }
  column "image" {
    null = true
    type = character_varying(100)
  }
  column "prev_call_time" {
    null = true
    type = integer
  }
  column "gesture" {
    null = true
    type = text
  }
  column "range_lower" {
    null = true
    type = integer
  }
  column "range_upper" {
    null = true
    type = integer
  }
  primary_key {
    columns = [column.id]
  }
  index "patrik_trigger_name_c2e3515d_like" {
    on {
      column = column.name
      ops    = varchar_pattern_ops
    }
  }
  check "patrik_trigger_period_check" {
    expr = "(period >= 0)"
  }
  unique "patrik_trigger_name_key" {
    columns = [column.name]
  }
}
table "patrik_triggerssettings" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "name" {
    null = false
    type = character_varying(30)
  }
  column "speech_enabled" {
    null = false
    type = boolean
  }
  column "gesture_enabled" {
    null = false
    type = boolean
  }
  column "event_enabled" {
    null = false
    type = boolean
  }
  column "face_enabled" {
    null = false
    type = boolean
  }
  column "priority" {
    null = false
    type = character_varying(9)
  }
  column "teach_mode" {
    null = false
    type = boolean
  }
  column "activation_word" {
    null = true
    type = character_varying(30)
  }
  column "language" {
    null = false
    type = character_varying(9)
  }
  primary_key {
    columns = [column.id]
  }
}
schema "public" {
  comment = "standard public schema"
}

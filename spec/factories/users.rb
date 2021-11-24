FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'aaa000'}
    first_name            {'洲悟'}
    last_name             {'吉村'}
    kana_first_name       {'シュウゴ'}
    kana_last_name        {'ヨシムラ'}
    birthday              {'20030410'}
  end
end
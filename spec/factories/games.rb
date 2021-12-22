FactoryBot.define do
  factory :game do
    mode { %i(pvp pve both).sample }
    release_date { "2021-12-21 20:49:02" }
    developer { "Faker:Company.name" }
    system_requirement
  end
end

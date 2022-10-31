# rubocop:disable Layout/LineLength
required_experience_points = [5, 5, 6, 6, 6, 6, 7, 7, 7, 8, 8, 9, 9, 9, 10, 10, 11, 11, 12, 13, 13, 14, 15, 15, 16, 17,
                              18, 19, 20, 21, 22, 23, 24, 25, 26, 28, 29, 30, 32, 33, 34, 35, 36, 37, 38, 39, 40, 42, 43, 44, 46, 47, 48, 50, 51, 53, 54, 56, 58, 59, 61, 63, 65, 67, 69, 71, 73, 75, 77, 80, 82, 85, 87, 90, 93, 95, 98, 101, 104, 107, 110, 114, 117, 121, 124, 128, 132, 136, 140, 144, 154, 165, 177, 189, 202, 216, 231, 248, 265, 284]
# rubocop:enable Layout/LineLength

exp_table = ExperienceTable.create(name: 'demo_20221031')

required_experience_points.each.with_index(1) do |point, i|
  exp_table.experience_columns.create(
    level: i,
    required_experience_point: point,
    accumulation_experience_point: required_experience_points.first(i).sum
  )
end
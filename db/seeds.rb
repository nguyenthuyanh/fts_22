# Users
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "123123123",
             password_confirmation: "123123123",
             admin:     true)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
              email: email,
              password:              password,
              password_confirmation: password)
end

#subjects
Subject.create!(content: "MySQL",
                number_questions: 20)
Subject.create!(content: "Ruby on Rails",
                number_questions: 30)
Subject.create!(content: "MySQL",
                number_questions: 20)
Subject.create!(content: "MySQL Exercise",
                number_questions: 30)
Subject.create!(content: "Git",
                number_questions: 20)

#questions
subjects = Subject.all
50.times do
  subjects.each { |subject|
    content = Faker::Lorem.sentence(1) 
    subject.questions.create(content: content)
  }
end

#answers
questions = Question.all 
questions.each { |question| 
  content = Faker::Lorem.sentence(1)
  question.answers.create(content: content, 
                          correct: true)
  3.times do
    content = Faker::Lorem.sentence(1)
    question.answers.create(content: content)
  end  
}

#examinations
subjects = Subject.all
student = User.first
subjects.each { |subject|
  student.examinations.create(subject_id: subject.id)
}

#answer_sheets
exams = Examination.all
exams.each { |exam|
  subject = Subject.find exam.subject_id
  questions = Question.create_questions(subject)
  questions.each { |question|
    answer = question.answers.shuffle.first
    if answer == question.answers.correct
      exam.answer_sheets.create question_id: question.id, 
                                answer_id: answer.id,
                                correct: true
    else
      exam.answer_sheets.create question_id: question.id, 
                                answer_id: answer.id
    end 
  } 
}
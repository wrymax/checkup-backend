"1. GET /questionnaire_submissions/:digest_key"
response = {
  questions: [
    {
      question_type: "scale", 
      title: "How many hours did you sleep last night?", 
      options: [
        "1 hour", 
        "2 hours"
      ]
    }
  ]
}

"2. POST /questionnaire_submissions/:digest_key/submit => submit the questionnaire"
response = {
  questionnaire_submission: {
    answers: [
      {
        question_id: 1,
        value: 0
      }
    ], 
    credit: 1.0, 
    points: 100.0, 
    current_team: {
      id: 1, 
      name: "Team 1", 
      description: "Desc of team1"
    }, 
    team_competition: [
      { name: "Team 1", description: "Desc of team1", points: 3000.0 }, 
      { name: "Team 2", description: "Desc of team2", points: 2000.0 }, 
      { name: "Team 3", description: "Desc of team3", points: 1000.0 }, 
      { name: "Team 4", description: "Desc of team4", points: 500.0 }
    ]
  }
}

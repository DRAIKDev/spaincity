

RegisterCommand("grabar", function()

  StartRecording(1)

end)



RegisterCommand("guardar", function() 

  StopRecordingAndSaveClip()

end)



RegisterCommand("editor", function() 

  NetworkSessionLeaveSinglePlayer()

  ActivateRockstarEditor()

end)
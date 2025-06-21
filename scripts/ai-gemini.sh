#!/bin/bash

generate_title() {
  if [[ -z "$GEMINI_API_KEY" ]]; then
    echo "Error: GEMINI_API_KEY environment variable is not set."
    return 1
  fi

  # Read input from stdin
  local prompt
  prompt=$(cat)

  curl -s "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${GEMINI_API_KEY}" \
  -H 'Content-Type: application/json' \
  -d "{
        \"contents\": [{
          \"parts\": [
            { \"text\": \"The output should be one word, it can contain hyphen or underscores. It should not have any other punctuations or surrounding quotes.. Provide a one-word title summarizing: ${prompt}\" }
          ]
        }],
        \"generationConfig\": {
          \"responseMimeType\": \"application/json\",
          \"responseSchema\": {
            \"type\": \"STRING\"
          }
        }
      }" | jq -r ".candidates.[0].content.parts.[0].text" | jq -r
}

generate_title "$@"

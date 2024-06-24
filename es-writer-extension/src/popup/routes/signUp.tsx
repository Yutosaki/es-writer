import React, { useState } from "react"
import { useStorage } from "@plasmohq/storage/hook"
import { useNavigate } from "react-router-dom"

import { api_endpoint } from "../../contents/index"

const signUp = () => {
  const [username, setUsername] = useState("")
  const [password, setPassword] = useState("")
  const [email, setEmail] = useState("")
  const navigate = useNavigate()

  const [loginState, setLoginState] = useStorage<string>("loginState");

  const handleSignUp = async (event: React.FormEvent) => {
    event.preventDefault()
    console.log("SignUp form submitted")

    const response = await fetch(api_endpoint + "/signup", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ username, password, email })
    })

    if (response.ok) {
      console.log("SignUp successful")
      setLoginState("checkEmail")
      navigate("/checkEmail")
    } else {
      console.error("Sign up failed")
      alert("Sign up failed")
    }
  }

  return (
    <>
    <form onSubmit={handleSignUp}>
      <h2>Sign Up</h2>
      <input
        type="text"
        placeholder="Username"
        value={username}
        onChange={(e) => setUsername(e.target.value)}
        required
      />
      <input
        type="password"
        placeholder="Password"
        value={password}
        onChange={(e) => setPassword(e.target.value)}
        required
      />
      <input
        type="email"
        placeholder="Email"
        value={email}
        onChange={(e) => setEmail(e.target.value)}
        required
      />
      <button type="submit">Sign Up</button>
    </form>
    <button onClick={() => {setLoginState("not-logged-in");navigate("/")}}>Back</button>
    </>
  )
}

export default signUp

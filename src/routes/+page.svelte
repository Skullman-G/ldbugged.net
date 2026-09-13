<script>
    const steroidStart = 1745695560;
    const steroidDate = new Date(steroidStart * 1000);
</script>

<div class="scroll">
    <h1>Welcome to my Homepage!</h1>
    <p>
        I'm Skully! <br>
        Pleased to meet you, traveller. <br>
        I just created this place. <br>
    </p>
    <br>
    <h2>About me:</h2>
    <p>In case you don't know me, here are some facts I stole from my Discord bio.</p>
    <ul>
        <li>My gf calls me Magical Computer Princess</li>
        <li>I use NixOS religiously on most of my devices</li>
        <li>I'm genderfluid or something like that</li>
        <li>I'm taking "steroids" since {steroidDate.toDateString()}</li>
    </ul>
    <p>Also, check out my girlfriend's awesome website at <a href="https://nele.pet" target="_blank">nele.pet</a>!</p>
    <br>
    <p>Welp. That's it for now.</p>
</div>

<style>
    :global(html),
    :global(body) {
        margin: 0;
        padding: 0;
        min-height: 100%;
    }

    :global(body) {
        background-color: antiquewhite;
        font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    }

    .scroll {
        background-color: bisque;
        min-height: 100vh;
        margin-left: 10%;
        margin-right: 10%;
        padding-left: 5%;
        padding-right: 5%;
        padding-top: 5px;
    }
</style>

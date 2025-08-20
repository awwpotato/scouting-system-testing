<script lang="ts">
   let items = [ "foo", "bar", "baz" ];

   let selected: string[];
</script>

<div class="max-w-96 m-auto min-h-dvh">
    <h1>Welcome to SvelteKit</h1>
    <p>Visit <a href="https://svelte.dev/docs/kit">svelte.dev/docs/kit</a> to read the documentation</p>

    <div class="flex flex-row flex-wrap gap-2 bg-gray-900">
        {#each items as item}
            <label class="rounded bg-violet-900 p-1 border-violet-700">
                <input class="not-checked:hidden border-none bg-transparent" type="checkbox" bind:group={selected} value={item}/>
                <span>{item}</span>
            </label>
        {/each}
    </div>
</div>

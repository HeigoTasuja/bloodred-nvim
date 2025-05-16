
# Neovim Basics: Movement & Modes

## Modes in Neovim

| Mode         | Description                               | Key to Enter         |
|--------------|-------------------------------------------|----------------------|
| Normal       | Default mode for navigation               | `Esc`                |
| Insert       | Insert text                               | `i`, `I`, `a`, `A`, `o`, `O` |
| Visual       | Select text                               | `v` (char), `V` (line), `Ctrl+v` (block) |
| Replace      | Replace text                              | `R`                  |
| Command-line | Execute commands                          | `:`                  |
| Terminal     | Embedded terminal mode                    | `:term`              |

---

## Movement in Normal Mode

| Action                  | Key(s)         |
|-------------------------|----------------|
| Left / Right / Up / Down | `h` / `l` / `k` / `j` |
| Word forward/backward   | `w` / `b`      |
| End of word             | `e`            |
| Start / End of line     | `0`, `^` / `$` |
| Page up / down          | `Ctrl+u` / `Ctrl+d` |
| Paragraph up / down     | `{` / `}`      |
| Top / Middle / Bottom of screen | `H` / `M` / `L` |
| Go to line N            | `:N`           |
| First / Last line       | `gg` / `G`     |

---

## Insert Mode Shortcuts

| Action                  | Key(s)         |
|-------------------------|----------------|
| Exit insert mode        | `Esc`          |
| Insert before cursor    | `i`            |
| Insert after cursor     | `a`            |
| New line below / above  | `o` / `O`      |
| Insert at start / end of line | `I` / `A` |

---

## Visual Mode Tips

| Action                  | Key(s)         |
|-------------------------|----------------|
| Start visual mode       | `v`, `V`, `Ctrl+v` |
| Yank (copy)             | `y`            |
| Delete (cut)            | `d`            |
| Change (replace)        | `c`            |
| Paste                   | `p`            |
| Exit visual mode        | `Esc`          |

---

## Additional

- Undo / Redo: `u` / `Ctrl+r`
- Repeat last command: `.`
- Delete line: `dd`
- Copy line: `yy`
- Paste: `p`

Happy Hacking! 🧛‍♀️

---

## 📁 File Tree (NvimTree)

| Action                     | Shortcut        |
|---------------------------|-----------------|
| Toggle file tree          | `<leader>e`     |
| Refresh file tree         | `R`             |
| Collapse/Expand directory | `<CR>` or `o`   |
| Create new file           | `a`             |
| Create new folder         | `a` (with `/`)  |
| Delete file/folder        | `d`             |
| Rename                   | `r`             |
| Cut                       | `x`             |
| Copy                      | `c`             |
| Paste                     | `p`             |
| Open in split             | `s` (horizontal), `v` (vertical) |

---

## 🌿 Git (with gitsigns)

| Action                          | Shortcut        |
|--------------------------------|-----------------|
| Stage hunk                     | `<leader>hs`    |
| Undo stage hunk                | `<leader>hu`    |
| Preview hunk                   | `<leader>hp`    |
| Blame line                     | `<leader>hb`    |
| Toggle deleted lines           | `<leader>hd`    |
| Next/Previous hunk             | `]c` / `[c`      |

---

## 🧠 LSP and Autocompletion

| Action                          | Shortcut          |
|--------------------------------|-------------------|
| Open completion menu           | `<C-Space>`       |
| Navigate suggestions           | `<Tab>` / `<S-Tab>` |
| Confirm suggestion             | `<CR>` (Enter)    |
| Go to definition               | `gd`              |
| Show hover documentation       | `K`               |
| Show signature help            | `<C-k>`           |
| Rename symbol                  | `<leader>rn`      |
| Code actions                   | `<leader>ca`      |
| Format current buffer          | `<leader>f`       |

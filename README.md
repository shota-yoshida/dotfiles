# dotfiles

## usage

### zshのインストール

```
# zshのインストール
sudo yum install zsh

# ログインシェルの変更
chsh -s /bin/zsh
```

### oh-my-zshのインストール
```
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```

### シンボリックリンクを張る
```
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
```

<?php
  class User{
    public $username;
    public $status;
  }
  $user = new User;
  $user->username = 'hacker';
  $user->status = 'not admin';
  echo serialize($user);
?>

#!/bin/bash

function update() {
  case $1 in
    -repo)
      svn up /home/sven/sep/repo/ --username svenvaupel --password kleine2106
      ;;
    -ij)
      svn up /home/sven/sep/repo_ij/ --username vaupel --password vAupi30
      ;;
    -kl)
      svn up /home/sven/sep/repo_kl/ --username vaupel --password vAupi30
      ;;
    *)
      updateArgumentError
      ;;
  esac
}

function commit() {
  case $1 in
    -repo)
      svn ci /home/sven/sep/repo/ --username svenvaupel --password kleine2106
      ;;
    -ij)
      svn ci /home/sven/sep/repo_ij/ --username vaupel --password vAupi30
      ;;
    -kl)
      svn ci /home/sven/sep/repo_kl/ --username vaupel --password vAupi30
      ;;
    *)
      updateArgumentError
      ;;
  esac
}

function recheck() {
  echo "recheck"
}

function firstArgumentError() {
  echo "firstArgumentError"
  #statements
}

function updateArgumentError() {
  echo "updateArgumentError"
  #statements
}
echo $1
echo $2
case $1 in
  -up)
    update $2
    ;;
  -ci)
    commit $2
    ;;
  -recheck)
    recheck
    ;;
  *)
    firstArgumentError
  ;;
esac

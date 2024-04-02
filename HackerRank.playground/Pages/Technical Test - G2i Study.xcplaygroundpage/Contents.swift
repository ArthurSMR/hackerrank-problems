import Foundation

/*
 Football Scores
 
 The number of goals achieved by two football teams in matches in a league is given in the form of two lists. For each match of team B, compute the total number of matches of team A where team A has scored less than or equal to the number of goals scored by team B in that match.
 
 Example:
 teamA = [1,2,3]
 teamB = [2,4]
 
 Team A has played three matches and has scored teamA = [1,2,3] goals in each match respectively. Team B has played two matches and has scored teamB = [2,4] goals in each match respectively. For 2 goals scored by team B in its first match, team A has 2 matches with scores 1 and 2. For 4 goals scored by team B in its second match, team A has 3 matches with scores 1,2 and 3. Hence, the answer is [2,3].
 
 Function Description
 - Complete the function counts in the editor below.
 
 counts has the following parameter(s):
  int teamA[n]: first array of positive integers
 int teamB[m]: second array of positive integers
 
 return
 int[m]: and array of m possitive integers, one for each
 - teamB[i] representing the total number of elements from teamA[j] satisfying teamA[j] <= teamB[i] where 0 <= j < n and 0 <= i < m, in the given order.
 
 Constraints
 - 2 <= n, m <= 10^5
 - 1 <= teamA[j]
 */

func numberOfMatchesAScoredLessGoals(teamA: [Int], teamB: [Int]) -> [Int] {
    
    var result: [Int] = []
    
    var sortedA = teamA.sorted()
    
    teamB.forEach {
        let count = searchLessNumbers(atArray: teamA, target: $0)
        result.append(count)
    }
    print(result)
    return result
}

func searchLessNumbers(atArray array: [Int], target: Int) -> Int {
    
    var left = 0
    var right = array.count - 1
    var lastIndex = -1
    
    while left <= right {
        
        let middleIndex = left + (right - left) / 2
        
        if array[middleIndex] <= target {
            lastIndex = middleIndex
            left = middleIndex + 1
        } else {
            right = middleIndex - 1
        }
    }
    return lastIndex + 1
}

var teamA: [Int] = [1,2,3]
var teamB: [Int] = [2,4]
numberOfMatchesAScoredLessGoals(teamA: teamA, teamB: teamB) // output: [2,3]

teamA = [2,5,9,10,11]
teamB = [1,100]
numberOfMatchesAScoredLessGoals(teamA: teamA, teamB: teamB)

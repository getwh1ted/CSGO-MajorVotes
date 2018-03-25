public VOTE_NotReadyForMatchHandler(Handle:vote, MenuAction:action, param1, param2)
{
	switch (action)
	{
		case MenuAction_End:
		{
			NativeVotes_Close(vote);
		}
		
		case MenuAction_VoteCancel:
		{
			if (param1 == VoteCancel_NoVotes)
			{
				NativeVotes_DisplayFail(vote, NativeVotesFail_NotEnoughVotes);
			}
			else
			{
				NativeVotes_DisplayFail(vote, NativeVotesFail_Generic);
			}
		}
		
		case MenuAction_VoteEnd:
		{
			if (param1 == NATIVEVOTES_VOTE_NO)
			{
				NativeVotes_DisplayFail(vote, NativeVotesFail_Loses);
			}
			else
			{
				NativeVotes_DisplayPass(vote, "#SFUI_vote_passed_not_ready_for_match");
				ServerCommand("mp_warmup_pausetimer 1");
			}
		}
	}
}